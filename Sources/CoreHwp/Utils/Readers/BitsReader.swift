import Foundation

struct BitsReader {
    private var bits: [Bool]
    private var offset: Int = 0

    init(from uint32: UInt32) {
        self.bits = uint32.bits
    }

    var isEOF: Bool {
        offset == bits.count
    }

    var remainBits: Int {
        bits.count - offset
    }

    mutating func readBit() -> Bool {
        defer {
            offset += 1
        }
        return bits[offset]
    }

    @discardableResult mutating func readBits(_ count: Int) -> [Bool] {
        defer {
            offset += count
        }
        return Array(bits[offset..<(offset+count)])
    }
}

func getBitValue<T: BinaryInteger>(mask: T, start: Int, end: Int) -> T {
    let target = mask >> start

    var temp: T = 0
    for _ in 0...(end - start) {
        temp <<= 1
        temp += 1
    }

    return target & temp
}
