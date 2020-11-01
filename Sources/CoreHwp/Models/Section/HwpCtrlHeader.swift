import Foundation

public struct HwpCtrlHeader {
    public var ctrlId: UInt32
}

extension HwpCtrlHeader: HwpFromRecord {

    init(_ record: HwpRecord) throws {
        var reader = DataReader(record.payload)
        ctrlId = reader.read(UInt32.self)
    }
}
