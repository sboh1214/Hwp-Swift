import Foundation

protocol HwpFromData: HwpPrimitive {
    init(_ reader: inout DataReader) throws
    static func load(_ data: Data) throws -> Self
}

extension HwpFromData {
    static func load(_ data: Data) throws -> Self {
        var reader = DataReader(data)
        let hwpFromData = try self.init(&reader)
        if !reader.isEOF {
            throw HwpError.bytesAreNotEOF(model: Self.self, remain: reader.remainBytes)
        }
        return hwpFromData
    }
}
