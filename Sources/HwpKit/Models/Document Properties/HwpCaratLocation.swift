import Foundation

struct HwpCaratLocation {
    let listId:UInt32
    let paragraphId:UInt32
    let charIndex:UInt32
    
    init(_ data: Data) {
        var reader = DataReader(data)
        listId = reader.readUInt32()
        paragraphId = reader.readUInt32()
        charIndex = reader.readUInt32()
    }
}
