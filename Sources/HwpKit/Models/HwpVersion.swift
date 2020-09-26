import Foundation

/**
 파일 버전. 0xMMnnPPrr의 형태(예 5.0.3.0)
 - MM: 문서 형식의 구조가 완전히 바뀌는 것을 나타냄. 숫
 자가 다르면 구 버전과 호환 불가능.
 - nn: 큰 구조는 동일하나, 큰 변화가 있는 것을 나타냄. 숫
 자가 다르면 구 버전과 호환 불가능.
 - PP: 구조는 동일, Record가 추가되었거나, 하위 버전에서
 호환되지 않는 정보가 추가된 것을 나타냄. 숫자가 달라도
 구 버전과 호환 가능.
 - rr: Record에 정보들이 추가된 것을 나타냄. 숫자가 달라
 도 구 버전과 호환 가능.
 */
public struct HwpVersion: HwpData {
    public let major: UInt8
    public let minor: UInt8
    public let build: UInt8
    public let revision: UInt8
    
    init(_ data: Data, _ report: (HwpReportable) -> Void) {
        var reader = DataReader(data)
        revision = reader.readUInt8()
        build = reader.readUInt8()
        minor = reader.readUInt8()
        major = reader.readUInt8()
    }
}
