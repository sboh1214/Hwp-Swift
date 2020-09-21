import Foundation

struct DataReader {
    let data: Data
    var offset: Int = 0

    init(_ data: Data) {
        self.data = data
    }

    mutating func readBytes(_ length: Int) -> Data {
        precondition(offset + length < data.count)
        defer {
            offset += length
        }
        return data[offset ..< offset + length]
    }

    mutating func readUInt16() -> UInt16 {
        readBytes(2).uint16
    }

    mutating func readUInt32() -> UInt32 {
        readBytes(4).uint32
    }
}
