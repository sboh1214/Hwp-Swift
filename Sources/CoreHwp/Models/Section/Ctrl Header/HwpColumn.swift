import Foundation

public struct HwpColumn {
    /**ctrl id*/
    public var otherCtrlId: HwpOtherCtrlId
    /**속성의 bit 0-15*/
    public var property: UInt16
    /**단 사이 간격*/
    public var spacing: HWPUNIT16
    /**단 너비가 동일하지 않으면, 단의 개수만큼 단의 폭*/
    public var widthArray: [WORD]
    /**속성의 bit 16-32*/
    // public var property2: UInt16
    /**단 구분선 종류*/
    public var dividerType: UInt8
    /**단 구분선 굵기*/
    public var dividerThickness: UInt8
    /**단 구분선 색상*/
    public var dividerColor: HwpColor
}

extension HwpColumn: HwpFromData {
    init(_ reader: inout DataReader) throws {
        let ctrlId = reader.read(UInt32.self)
        if let otherCtrlId = HwpOtherCtrlId.init(rawValue: ctrlId) {
            self.otherCtrlId = otherCtrlId
        } else {
            throw HwpError.invalidCtrlId(ctrlId: ctrlId)
        }

        property = reader.read(UInt16.self)
        spacing = reader.read(HWPUNIT16.self)
        let count = getBitValue(mask: Int(property), start: 2, end: 9)
        widthArray = (0..<count).map { _ in reader.read(WORD.self)}
        // property2 = reader.read(UInt16.self)
        dividerType = reader.read(UInt8.self)
        dividerThickness = reader.read(UInt8.self)
        dividerColor = HwpColor(reader.read(COLORREF.self))
    }
}

extension HwpColumn {
    init() {
        otherCtrlId = .column
        property = 4100
        spacing = 0
        widthArray = [0]
        dividerType = 0
        dividerThickness = 0
        dividerColor = HwpColor(0, 0, 0)
    }
}
