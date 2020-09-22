import Foundation

struct HwpStartingIndex {
    let page:UInt16
    let footnote: UInt16
    let endnote:UInt16
    let picture: UInt16
    let table: UInt16
    let equation: UInt16
    
    init(_ data:Data) {
        var reader = DataReader(data)
        page = reader.readUInt16()
        footnote = reader.readUInt16()
        endnote = reader.readUInt16()
        picture = reader.readUInt16()
        table = reader.readUInt16()
        equation = reader.readUInt16()
    }
}
