import Foundation

/**
 레이아웃 호환성
 
 Tag ID : HWPTAG_LAYOUT_COMPATIBILITY
 */
public struct HwpLayoutCompatibility: HwpFromData {
    /**글자 단위 서식*/
    public let char: UInt32
    /**문단 단위 서식*/
    public let paragraph: UInt32
    /**구역 단위 서식*/
    public let section: UInt32
    /**개체 단위 서식*/
    public let object: UInt32
    /**필드 단위 서식*/
    public let field: UInt32

    init(_ data: Data) throws {
        var reader = DataReader(data)
        defer {
            precondition(reader.isEOF())
        }
        char = reader.read(UInt32.self)
        paragraph = reader.read(UInt32.self)
        section = reader.read(UInt32.self)
        object = reader.read(UInt32.self)
        field = reader.read(UInt32.self)
    }
}
