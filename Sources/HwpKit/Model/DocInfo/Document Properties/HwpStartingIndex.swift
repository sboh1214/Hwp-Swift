import Foundation

public struct HwpStartingIndex: HwpFromData {
    public let page: UInt16
    public let footnote: UInt16
    public let endnote: UInt16
    public let picture: UInt16
    public let table: UInt16
    public let equation: UInt16

    init(_ data: Data) {
        var reader = DataReader(data)
        page = reader.read(UInt16.self)
        footnote = reader.read(UInt16.self)
        endnote = reader.read(UInt16.self)
        picture = reader.read(UInt16.self)
        table = reader.read(UInt16.self)
        equation = reader.read(UInt16.self)
    }
}
