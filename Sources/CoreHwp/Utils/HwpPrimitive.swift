import Foundation

public typealias HwpPrimitive = Hashable & Codable

protocol HwpFromData: HwpPrimitive {
    init(_ reader: inout DataReader) throws
    static func load(_ data: Data) throws -> Self
}

extension HwpFromData {
    static func load(_ data: Data) throws -> Self {
        var reader = DataReader(data)
        let hwpFromData = try self.init(&reader)
        if !reader.isEOF {
            throw HwpError.dataIsNotEOF(model: Self.self, remain: reader.remainBytes)
        }
        return hwpFromData
    }
}

protocol HwpFromDataWithVersion: HwpPrimitive {
    init(_ reader: inout DataReader, _ version: HwpVersion) throws
    static func load(_ data: Data, _ version: HwpVersion) throws -> Self
}

extension HwpFromDataWithVersion {
    static func load(_ data: Data, _ version: HwpVersion) throws -> Self {
        var reader = DataReader(data)
        let hwpFromDataWithVersion = try self.init(&reader, version)
        if !reader.isEOF {
            throw HwpError.dataIsNotEOF(model: Self.self, remain: reader.remainBytes)
        }
        return hwpFromDataWithVersion
    }
}

protocol HwpFromRecord: HwpPrimitive {
    init(_ record: HwpRecord) throws
}

protocol HwpFromRecordWithVersion: HwpPrimitive {
    init(_ record: HwpRecord, _ version: HwpVersion) throws
}
