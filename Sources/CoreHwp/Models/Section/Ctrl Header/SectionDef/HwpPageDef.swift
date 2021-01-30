/**
 4.3.10.1.1. 용지 설정

 Tag ID : HWPTAG_PAGE_DEF
 */
public struct HwpPageDef {
    /** 용지 가로 크기 */
    public var width: HWPUNIT
    /** 용지 세로 크기 */
    public var height: HWPUNIT
    /** 왼쪽 여백 */
    public var marginLeft: HWPUNIT
    /** 오른쪽 여백 */
    public var marginRight: HWPUNIT
    /** 위 여백 */
    public var marginTop: HWPUNIT
    /** 아래 여백 */
    public var marginBottom: HWPUNIT
    /** 머리말 여백 */
    public var marginHeader: HWPUNIT
    /** 꼬리말 여백 */
    public var marginFootnote: HWPUNIT
    /** 제본 여백 */
    public var marginGutter: HWPUNIT
    /** 속성 */
    public var property: UInt32
}

extension HwpPageDef: HwpFromData {
    init(_ reader: inout DataReader) throws {
        width = reader.read(HWPUNIT.self)
        height = reader.read(HWPUNIT.self)
        marginLeft = reader.read(HWPUNIT.self)
        marginRight = reader.read(HWPUNIT.self)
        marginTop = reader.read(HWPUNIT.self)
        marginBottom = reader.read(HWPUNIT.self)
        marginHeader = reader.read(HWPUNIT.self)
        marginFootnote = reader.read(HWPUNIT.self)
        marginGutter = reader.read(HWPUNIT.self)
        property = reader.read(UInt32.self)
    }
}

extension HwpPageDef {
    init() {
        width = 59528
        height = 84186
        marginLeft = 8504
        marginRight = 8504
        marginTop = 5668
        marginBottom = 4252
        marginHeader = 4252
        marginFootnote = 4252
        marginGutter = 0
        property = 0
    }
}
