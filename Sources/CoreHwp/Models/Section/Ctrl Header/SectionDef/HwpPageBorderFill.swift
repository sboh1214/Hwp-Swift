import Foundation

/**
 4.3.10.1.3. 쪽 테두리/배경

 Tag ID : HWPTAG_PAGE_BORDER_FILL
 */
public struct HwpPageBorderFill {
    /**속성*/
    public var property: UInt32
    /**테두리/배경 위치 왼쪽 간격*/
    public var spacingLeft: HWPUNIT16
    /**테두리/배경 위치 오른쪽 간격*/
    public var spacingRight: HWPUNIT16
    /**테두리/배경 위치 위쪽 간격*/
    public var spacingTop: HWPUNIT16
    /**테두리/배경 위치 아래쪽 간격*/
    public var spacingBottom: HWPUNIT16
    /**테두리/배경 ID*/
    public var borderFillId: UInt16
}

extension HwpPageBorderFill: HwpFromData {
    init(_ reader: inout DataReader) throws {
        property = reader.read(UInt32.self)
        spacingLeft = reader.read(HWPUNIT16.self)
        spacingRight = reader.read(HWPUNIT16.self)
        spacingTop = reader.read(HWPUNIT16.self)
        spacingBottom = reader.read(HWPUNIT16.self)
        borderFillId = reader.read(UInt16.self)
    }
}

extension HwpPageBorderFill {
    init(property: UInt32) {
        self.property = property
        spacingLeft = 1417
        spacingRight = 1417
        spacingTop = 1417
        spacingBottom = 1417
        borderFillId = 1
    }
}
