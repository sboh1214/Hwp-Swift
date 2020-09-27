import Foundation

/**
 파일 인식 정보
 
 한글의 문서 파일이라는 것을 나타내기 위해 ‘파일 인식 정보’가 저장된다.
 */
public struct HwpFileHeader: HwpData {
    /** signature. 문서 파일은 "HWP Document File" */
    public let signature: String
    public let version: HwpVersion

    /** 압축 여부 */
    public let isCompressed: Bool
    /** 암호 설정 여부 */
    public let isEncrypted: Bool

    /** CCL, 공공누리 라이선스 정보 */
    public let isHavekoreaOpenLicense: Bool

    /**
     EncryptVersion
     - 0 : None
     - 1 : (한글 2.5 버전 이하)
     - 2 : (한글 3.0 버전 Enhanced)
     - 3 : (한글 3.0 버전 Old)
     - 4 : (한글 7.0 버전 이후)
     */
    public let encryptVersion: UInt32
    public let koreaOpenLicense: UInt8 // 공공누리 Korea Open Government License

    internal init(_ data: Data) throws {
        var reader = DataReader(data)

        guard let signature = reader.readBytes(32).stringASCII else {
            throw HwpError.invalidDataForString(data: data[0 ..< 32], name: "signature")
        }
        self.signature = signature
        if signature != "HWP Document File\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0" {
            throw HwpError.invalidFileHeaderSignature(signature: signature)
        }

        version = HwpVersion(reader.readBytes(4))

        let bits1 = reader.readBytes(4).bits
        isCompressed = bits1[0]
        isEncrypted = bits1[1]

        let bits2 = reader.readBytes(4).bits
        isHavekoreaOpenLicense = bits2[0]

        encryptVersion = reader.readUInt32()
        koreaOpenLicense = reader.readUInt8()
    }
}
