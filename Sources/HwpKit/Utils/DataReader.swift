import Foundation

struct DataReader {
    let data: Data
    var offset: Int = 0

    init(_ data: Data) {
        self.data = data
    }

    mutating func readBytes(_ length: Int) -> Data {
        precondition(offset + length < data.count + 1)
        defer {
            offset += length
        }
        // The indices of a Data value (or of collections in general) are not necessarily zero-based.
        // A slice shares the indices with the originating data.
        return data[(offset+data.startIndex) ..< (offset+data.startIndex) + length]
    }

    mutating func readUInt8() -> UInt8 {
        return readBytes(1).uint8
    }

    mutating func readUInt16() -> UInt16 {
        return readBytes(2).uint16
    }

    mutating func readUInt32() -> UInt32 {
        return readBytes(4).uint32
    }
}
