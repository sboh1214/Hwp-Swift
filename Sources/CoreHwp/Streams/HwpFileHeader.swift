import Foundation

/**
 3.2.1. 파일 인식 정보

 한글의 문서 파일이라는 것을 나타내기 위해 ‘파일 인식 정보’가 저장된다.
 */
public struct HwpFileHeader: HwpFromData {
    /**
     signature

     문서 파일은 "HWP Document File"
     */
    public var signature: String
    public var version: HwpVersion

    public var fileProperty: HwpFileProperty

    public var fileLicense: HwpFileLicense

    /**
     EncryptVersion
     - 0 : None
     - 1 : (한글 2.5 버전 이하)
     - 2 : (한글 3.0 버전 Enhanced)
     - 3 : (한글 3.0 버전 Old)
     - 4 : (한글 7.0 버전 이후)
     */
    public var encryptVersion: UInt32
    /** 공공누리 Korea Open Government License */
    public var koreaOpenLicense: UInt8

    init(_ reader: inout DataReader) throws {
        let signatureData = reader.readBytes(32)
        guard let signature = signatureData.stringASCII else {
            throw HwpError.invalidDataForString(data: signatureData, name: "signature")
        }
        self.signature = signature
        if signature != "HWP Document File\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0" {
            throw HwpError.invalidFileHeaderSignature(signature: signature)
        }

        version = try HwpVersion.load(reader.readBytes(4))

        fileProperty = try HwpFileProperty.load(reader.read(DWORD.self))
        fileLicense = try HwpFileLicense.load(reader.read(DWORD.self))

        encryptVersion = reader.read(UInt32.self)
        koreaOpenLicense = reader.read(UInt8.self)

        reader.readBytes(207)
    }
}

extension HwpFileHeader {
    init() {
        signature = "HWP Document File\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"
        version = HwpVersion()

        fileProperty = HwpFileProperty()
        fileLicense = HwpFileLicense()

        encryptVersion = 4
        koreaOpenLicense = 0
    }
}
