import Foundation

struct BitsReader<T: BinaryInteger> {
    private var bits: [Bool]
    private var offset: Int = 0

    init(from int: T) {
        bits = int.bits
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
        return Array(bits[offset ..< (offset + count)])
    }

    mutating func readInt(_ count: Int) -> Int {
        let array = readBits(count)
        return array
            .map { $0 ? 1 : 0 }
            .enumerated().reversed()
            .reduce(0) { accumulate, current in
                let index = current.0
                let element = current.1
                return accumulate + element * 2 ^^ index
            }
    }
}

precedencegroup PowerPrecedence { higherThan: MultiplicationPrecedence }
infix operator ^^: PowerPrecedence
func ^^ (radix: Int, power: Int) -> Int {
    Int(pow(Double(radix), Double(power)))
}

func getBitValue<T: BinaryInteger>(mask: T, start: Int, end: Int) -> T {
    let target = mask >> start

    var temp: T = 0
    for _ in 0 ... (end - start) {
        temp <<= 1
        temp += 1
    }

    return target & temp
}
