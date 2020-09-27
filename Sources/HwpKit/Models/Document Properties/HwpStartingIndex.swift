import Foundation

public struct HwpStartingIndex: HwpData {
    public let page: UInt16
    public let footnote: UInt16
    public let endnote: UInt16
    public let picture: UInt16
    public let table: UInt16
    public let equation: UInt16

    init(_ data: Data) {
        var reader = DataReader(data)
        page = reader.readUInt16()
        footnote = reader.readUInt16()
        endnote = reader.readUInt16()
        picture = reader.readUInt16()
        table = reader.readUInt16()
        equation = reader.readUInt16()
    }
}
