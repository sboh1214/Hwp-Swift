public struct HwpTableProperty {
    /**속성*/
    public var property: UInt32
    /**RowCount*/
    public var rowCount: UInt16
    /**nCols*/
    public var columnCount: UInt16
    /**CellSpacing*/
    public var cellSpacing: HWPUNIT16
    /**왼쪽 여백*/
    public var leftInnerMargin: HWPUNIT16
    /**오른쪽 여백*/
    public var rightInnerMargin: HWPUNIT16
    /**위쪽 여백*/
    public var topInnerMargin: HWPUNIT16
    /**아래쪽 여백*/
    public var bottomInnerMargin: HWPUNIT16
    /**Row Size*/
    public var rowSize: [BYTE]
    /**Border Fill ID*/
    public var borderFillId: UInt16
    /**
     Valid Zone Info Size
     
     (5.0.1.0 이상)
     */
    public var validZoneInfoSize: UInt16?
    /**
     영역 속성
     
     (5.0.1.0 이상)
     */
    public var zonePropertyArray: [HwpZoneProperty]?
}

extension HwpTableProperty: HwpFromDataWithVersion {
    init(_ reader: inout DataReader, _ version: HwpVersion) throws {
        property = reader.read(UInt32.self)
        rowCount = reader.read(UInt16.self)
        columnCount = reader.read(UInt16.self)
        cellSpacing = reader.read(HWPUNIT16.self)
        leftInnerMargin = reader.read(HWPUNIT16.self)
        rightInnerMargin = reader.read(HWPUNIT16.self)
        topInnerMargin = reader.read(HWPUNIT16.self)
        bottomInnerMargin = reader.read(HWPUNIT16.self)
        rowSize = reader.readBytes(rowCount*2).bytes
        borderFillId = reader.read(UInt16.self)
        if version >= HwpVersion(5, 0, 1, 0) {
            let zonePropertySize = reader.read(UInt16.self)
            validZoneInfoSize = zonePropertySize
            zonePropertyArray = try (0..<zonePropertySize).map {_ in try HwpZoneProperty(&reader)}
        }
    }
}
