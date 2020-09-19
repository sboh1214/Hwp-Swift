import OLEKit

/**
 파일 인식 정보
 한글의 문서 파일이라는 것을 나타내기 위해 ‘파일 인식 정보’가 저장된다.
 */
public struct HwpFileHeader: Stream {
    public let signature: String
    public let version: HwpVersion
    
    /**압축 여부*/
    public let isCompressed: Bool
    /**암호 설정 여부*/
    public let isEncrypted: Bool
    
    /**CCL, 공공누리 라이선스 정보*/
    public let isHavekoreaOpenLicense: Bool

    let encryptVersion: UInt32
    let koreaOpenLicense: UInt8 //공공누리 Korea Open Government License

    init(dataReader: DataReader) {
        signature = String(data: dataReader.readData(ofLength: 32), encoding: .ascii) ?? "Error"

        let revision: UInt8 = dataReader.read()
        let build: UInt8 = dataReader.read()
        let minor: UInt8 = dataReader.read()
        let major: UInt8 = dataReader.read()
        version = HwpVersion(major: major, minor: minor, build: build, revision: revision)
        
        let dword1:UInt32 = dataReader.read()
        let bits1 = bitsFromUInt32(dword1)
        isCompressed = bits1[0]
        isEncrypted = bits1[1]
        
        let dword2:UInt32 = dataReader.read()
        let bits2 = bitsFromUInt32(dword2)
        isHavekoreaOpenLicense = bits2[0]
        
        
        encryptVersion = dataReader.read()
        koreaOpenLicense = dataReader.read()
    }
}
