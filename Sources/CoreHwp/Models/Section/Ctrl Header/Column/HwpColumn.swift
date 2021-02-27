import Foundation

public struct HwpColumn {
    /** ctrl id */
    public var otherCtrlId: HwpOtherCtrlId
    /** 속성의 bit 0-15 */
    public var property: HwpColumnProperty
    /** 단 사이 간격 */
    public var spacing: HWPUNIT16?
    /** 단 너비가 동일하지 않으면, 단의 개수만큼 단의 폭 */
    public var widthArray: [WORD]?
    /** 속성의 bit 16-32 */
    public var property2: UInt16?
    /** 단 구분선 종류 */
    public var dividerType: UInt8
    /** 단 구분선 굵기 */
    public var dividerThickness: UInt8
    /** 단 구분선 색상 */
    public var dividerColor: HwpColor
    /** Unknown 6 bytes */
    public var unknown: Data?
}

extension HwpColumn: HwpFromData {
    init(_ reader: inout DataReader) throws {
        let ctrlId = reader.read(UInt32.self)
        if let otherCtrlId = HwpOtherCtrlId(rawValue: ctrlId) {
            self.otherCtrlId = otherCtrlId
        } else {
            throw HwpError.invalidCtrlId(ctrlId: ctrlId)
        }

        let property = try HwpColumnProperty.load(reader.read(UInt16.self))

        if property.count < 2 || property.isSameWidth {
            spacing = reader.read(HWPUNIT16.self)
            property2 = reader.read(UInt16.self)
        } else {
            widthArray = (0 ..< property.count).map { _ in reader.read(WORD.self) }
        }
        self.property = property

        dividerType = reader.read(UInt8.self)
        dividerThickness = reader.read(UInt8.self)
        dividerColor = HwpColor(reader.read(COLORREF.self))

        if !reader.isEOF {
            unknown = reader.readBytes(6)
        }
    }
}

extension HwpColumn {
    init() {
        otherCtrlId = .column
        property = HwpColumnProperty()
        spacing = 0
        dividerType = 0
        dividerThickness = 0
        dividerColor = HwpColor(0, 0, 0)
    }
}
