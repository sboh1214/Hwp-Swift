import Foundation

protocol HwpFromUInt32: HwpPrimitive {
    init(_ reader: inout BitsReader) throws
    static func load(_ uint32: UInt32) throws -> Self
}

extension HwpFromUInt32 {
    static func load(_ uint32: UInt32) throws -> Self {
        var reader = BitsReader(from: uint32)
        let hwpFromUInt32 = try self.init(&reader)
        if !reader.isEOF {
            throw HwpError.bitsAreNotEOF(model: Self.self, remain: reader.remainBits)
        }
        return hwpFromUInt32
    }
}
