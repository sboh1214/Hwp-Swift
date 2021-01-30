import Foundation

extension UInt32 {
    var bits: [Bool] {
        let byteArray = withUnsafeBytes(of: littleEndian) {
            Array($0)
        }
        return byteArray.flatMap(\.bits)
    }
}
