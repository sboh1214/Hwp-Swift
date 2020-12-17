import Foundation

extension UInt32 {
    var bits: [Bool] {
        let byteArray = withUnsafeBytes(of: self.bigEndian) {
            Array($0)
        }
        return byteArray.flatMap { $0.bits }
    }
}
