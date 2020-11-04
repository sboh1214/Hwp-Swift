import Foundation

/**
 테두리/배경
 
 Tag ID : HWPTAG_BORDER_FILL
 */
public struct HwpBorderFill {
    /**속성*/
    public let property: UInt16
    /**4방향 테두리선 종류*/
    public let borderType: [UInt8]
    /**4방향 테두리선 굵기*/
    public let borderThickness: [UInt8]
    /**4방향 테두리선 색상*/
    public let borderColor: [HwpColor]
    /**대각선 종류*/
    public let diagonalType: UInt8
    /**대각선 굵기*/
    public let diagonalThickness: UInt8
    /**대각선 색깔*/
    public let diagonalColor: HwpColor
    /**채우기 정보*/
    public let fillInfo: [BYTE]
}

extension HwpBorderFill: HwpFromData {
    init() {
        property = 0
        borderType = [0, 0, 0, 0]
        borderThickness = [0, 0, 0, 0]
        borderColor = Array(repeating: HwpColor(), count: 4)
        diagonalType = 0
        diagonalThickness = 0
        diagonalColor = HwpColor()
        fillInfo = [BYTE]()
    }

    init(_ reader: inout DataReader) throws {
        property = reader.read(UInt16.self)
        borderType = reader.readBytes(4).bytes
        borderThickness = reader.readBytes(4).bytes
        borderColor = reader.read(UInt32.self, 4).map {HwpColor($0)}
        diagonalType = reader.read(UInt8.self)
        diagonalThickness = reader.read(UInt8.self)
        diagonalColor = HwpColor(reader.read(UInt32.self))
        fillInfo = reader.readToEnd().bytes
    }
}

extension HwpBorderFill {
    init(fillInfo: [BYTE]) {
        self.property = 0
        self.borderType = [0, 0, 0, 0]
        self.borderThickness = [0, 0, 0, 0]
        self.borderColor = Array(repeating: HwpColor(), count: 4)
        self.diagonalType = 1
        self.diagonalThickness = 0
        self.diagonalColor = HwpColor()
        self.fillInfo = fillInfo
    }
}
