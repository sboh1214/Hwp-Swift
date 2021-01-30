import Foundation

/**
 4.3.10.9. 쪽 번호 위치
 */
public struct HwpPageNumberPosition {
    /** 속성 */
    public var property: UInt32
    /** 사용자 기호 */
    public var userSymbol: WCHAR
    /** 앞 장식 문자 */
    public var headDecoration: WCHAR
    /** 뒤 장식 문자 */
    public var tailDecoration: WCHAR
    /** 항상 "-" */
    public var unused: WCHAR
    /** unknown */
    public var unknown: UInt32
}

extension HwpPageNumberPosition: HwpFromData {
    init(_ reader: inout DataReader) throws {
        property = reader.read(UInt32.self)
        userSymbol = reader.read(WCHAR.self)
        headDecoration = reader.read(WCHAR.self)
        tailDecoration = reader.read(WCHAR.self)
        unused = reader.read(WCHAR.self)
        unknown = reader.read(UInt32.self)
    }
}
