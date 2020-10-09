import Foundation

public struct HwpBorderFill: HwpFromData {
    public let property: UInt16
    public let borderType: [UInt8]
    public let borderThickness: [UInt8]
    public let borderColor: [HwpColor]
    public let diagonalType: UInt8
    public let diagonalThickness: UInt8
    public let diagonalColor: HwpColor
    public let fillInfo: [BYTE]

    init(_ data: Data) throws {
        var reader = DataReader(data)
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
