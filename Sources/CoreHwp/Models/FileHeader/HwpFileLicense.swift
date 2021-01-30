import Foundation

public struct HwpFileLicense {
    /** CCL, 공공누리 라이선스 정보 */
    public var doesHaveKoreaOpenLicense: Bool
    /** 복제 제한 여부 */
    public var doesLimitReplication: Bool
    /**
     동일 조건 하에 복제 허가 여부

     복제 제한인 경우 무시
     */
    public var doesHavePermission: Bool

    var unused: [Bool]
}

extension HwpFileLicense: HwpFromUInt32 {
    init(_ reader: inout BitsReader) throws {
        doesHaveKoreaOpenLicense = reader.readBit()
        doesLimitReplication = reader.readBit()
        doesHavePermission = reader.readBit()

        unused = reader.readBits(29)
    }
}

extension HwpFileLicense {
    init() {
        doesHaveKoreaOpenLicense = false
        doesLimitReplication = false
        doesHavePermission = false

        unused = Array(repeating: false, count: 29)
    }
}
