import Foundation

public struct HwpCtrlNoChildren {
    public var ctrlId: UInt32
}

extension HwpCtrlNoChildren: HwpFromRecord {
    init(_ record: HwpRecord) throws {
        var reader = DataReader(record.payload)
        ctrlId = reader.read(UInt32.self)
    }
}
