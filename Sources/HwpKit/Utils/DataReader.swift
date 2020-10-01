import Foundation

struct DataReader {
    private let data: Data
    private var offset: Int = 0

    init(_ data: Data) {
        self.data = data
    }

    func isEOF() -> Bool {
        return offset == data.count
    }

    mutating func readBytes(_ length: Int) -> Data {
        precondition(offset + length < data.count + 1)
        defer {
            offset += length
        }
        // The indices of a Data value are not necessarily zero-based.
        // A slice shares the indices with the originating data.
        return data[(offset+data.startIndex) ..< (offset+data.startIndex) + length]
    }

    mutating func readToEnd() -> Data {
        readBytes(data.count - offset)
    }

    mutating func read<T>(_ type: T.Type) -> T {
        let length: Int
        switch type {
        case is UInt8.Type, is Int8.Type:
            length = 1
        case is UInt16.Type, is Int16.Type:
            length = 2
        case is UInt32.Type, is Int32.Type:
            length = 4
        default:
            precondition(false)
            length = 4
        }
        let value = [UInt8](readBytes(length))
        return value.withUnsafeBufferPointer {
            $0.baseAddress!.withMemoryRebound(to: T.self, capacity: 1) {
                $0.pointee
            }
        }
    }

    mutating func read<T>(_ type: T.Type, _ length: Int) -> [T] {
        var array = [T]()
        for _ in 0..<length {
            array.append(read(T.self))
        }
        return array
    }
}
