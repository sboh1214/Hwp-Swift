import Foundation

public struct HwpPageDef {
    public var ctrlId: UInt32
}

extension HwpPageDef : HwpFromRecord {
    init(_ record: HwpRecord) throws {
        var reader = DataReader(record.payload)
        ctrlId = reader.read(UInt32.self)
    }
}
