import Foundation

/**
 파일 인식 정보
 한글의 문서 파일이라는 것을 나타내기 위해 ‘파일 인식 정보’가 저장된다.
 */
public struct HwpFileHeader: HwpStream {
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
    let encryptVersion: UInt32
    let koreaOpenLicense: UInt8 // 공공누리 Korea Open Government License

    internal init(_ data: Data, _ report: (HwpReportable) -> Void) throws {
        guard let signature = data[0 ..< 32].stringASCII else {
            throw HwpError.invalidDataForString(data: data[0 ..< 32], name: "signature")
        }
        self.signature = signature
        if signature != "HWP Document File\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0" {
            report(HwpWarning.invalidFileHeaderSignature(signature: signature))
        }

        let revision: UInt8 = data[32]
        let build: UInt8 = data[33]
        let minor: UInt8 = data[34]
        let major: UInt8 = data[35]
        version = HwpVersion(major: major, minor: minor, build: build, revision: revision)

        let bits1 = data[36 ..< 40].bits
        isCompressed = bits1[0]
        isEncrypted = bits1[1]

        let bits2 = data[40 ..< 44].bits
        isHavekoreaOpenLicense = bits2[0]

        encryptVersion = data[44 ..< 48].uint32
        koreaOpenLicense = UInt8(data[48])
    }
}
