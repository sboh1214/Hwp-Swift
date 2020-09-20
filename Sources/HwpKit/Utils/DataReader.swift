import Foundation

struct DataReader {
    let data: Data
    var offset: Int = 0

    init(_ data: Data) {
        self.data = data
    }

    mutating func readUInt16() -> UInt16 {
        precondition(offset+2<data.count)
        defer {
            offset += 2
        }
        return data[offset..<offset+2].uint16
    }
}
