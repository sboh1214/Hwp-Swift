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

func bitsFromData(data: Data) -> [Bool] {
    return data.reduce([Bool]()) {$0 + bitsFromUInt8($1)}
}

func bitsFromUInt8(_ byte: UInt8) -> [Bool] {
    var byte = byte
    var bits = [Bool](repeating: false, count: 8)
    for i in 0..<8 {
        let currentBit = byte & 0x01
        if currentBit != 0 {
            bits[i] = true
        }

        byte >>= 1
    }

    return bits
}

// get a Bit array from a byte
func bitsFromUInt32(_ byte: UInt32) -> [Bool] {
    var byte = byte
    var bits = [Bool](repeating: false, count: 32)
    for i in 0..<32 {
        let currentBit = byte & 0x01
        if currentBit != 0 {
            bits[i] = true
        }

        byte >>= 1
    }

    return bits
}

//let byte: UInt8 = 0x1f
//print(bits(fromByte: byte))
