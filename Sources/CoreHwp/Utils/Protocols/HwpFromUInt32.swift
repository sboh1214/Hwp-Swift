import Foundation

protocol HwpFromUInt32: HwpPrimitive {
    init(_ reader: inout BitsReader) throws
    static func load(_ uint: UInt32) throws -> Self
}

extension HwpFromUInt32 {
    static func load(_ uint: UInt32) throws -> Self {
        var reader = BitsReader(from: uint)
        let hwpFromUInt32 = try self.init(&reader)
        if !reader.isEOF {
            throw HwpError.bitsAreNotEOF(model: Self.self, remain: reader.remainBits)
        }
        return hwpFromUInt32
    }
}

protocol HwpFromUInt16: HwpPrimitive {
    init(_ reader: inout BitsReader) throws
    static func load(_ uint: UInt16) throws -> Self
}

extension HwpFromUInt16 {
    static func load(_ uint: UInt16) throws -> Self {
        var reader = BitsReader(from: uint)
        let hwpFromUInt16 = try self.init(&reader)
        if !reader.isEOF {
            throw HwpError.bitsAreNotEOF(model: Self.self, remain: reader.remainBits)
        }
        return hwpFromUInt16
    }
}
