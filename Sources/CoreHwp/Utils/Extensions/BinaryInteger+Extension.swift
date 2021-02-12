import Foundation

extension BinaryInteger {
    var bits: [Bool] {
        var binArray = [Bool]()
        var internalNumber = self
        var counter = 0

        for _ in 0 ..< bitWidth {
            binArray.append(internalNumber & 1 == 1)
            internalNumber >>= 1
            counter += 1
        }

        return binArray
    }
}
