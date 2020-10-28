import Foundation

public struct HwpTable {
    public var ctrlId: UInt32
}

extension HwpTable: HwpFromRecord {
    init(_ record: HwpRecord) throws {
        var reader = DataReader(record.payload)
        ctrlId = reader.read(UInt32.self)
    }
}
