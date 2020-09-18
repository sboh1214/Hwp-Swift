import Foundation

// Data to [bytes]
extension Data {
    var bytes: [UInt8] {
        return [UInt8](self)
    }
}

// [bytes] to Data
extension Array where Element == UInt8 {
    var data: Data {
        return Data(self)
    }
}

// get a Bit array from a byte
func bits(fromByte byte: UInt8) -> [Bit] {
    var byte = byte
    var bits = [Bit](repeating: .zero, count: 8)
    for i in 0..<8 {
        let currentBit = byte & 0x01
        if currentBit != 0 {
            bits[i] = .one
        }

        byte >>= 1
    }

    return bits
}

//let byte: UInt8 = 0x1f
//print(bits(fromByte: byte))

enum Bit: UInt8, CustomStringConvertible {
    case zero, one

    var description: String {
        switch self {
        case .one:
            return "1"
        case .zero:
            return "0"
        }
    }
}
