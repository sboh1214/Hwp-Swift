import Foundation

protocol HwpFromUInt: HwpPrimitive {
    associatedtype UIntType: BinaryInteger
    init(_ reader: inout BitsReader<UIntType>) throws
    static func load(_ uint: UIntType) throws -> Self
}

extension HwpFromUInt {
    static func load(_ uint: UIntType) throws -> Self {
        var reader = BitsReader(from: uint)
        let hwpFromUInt = try self.init(&reader)
        if !reader.isEOF {
            throw HwpError.bitsAreNotEOF(model: Self.self, remain: reader.remainBits)
        }
        return hwpFromUInt
    }
}
