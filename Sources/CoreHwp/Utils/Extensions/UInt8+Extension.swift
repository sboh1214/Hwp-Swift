import Foundation

extension UInt8 {
    var bits: [Bool] {
        var byte = self
        var bits = [Bool](repeating: false, count: 8)
        for index in 0 ..< 8 {
            let currentBit = byte & 0x01
            if currentBit != 0 {
                bits[index] = true
            }

            byte >>= 1
        }

        return bits
    }
}
