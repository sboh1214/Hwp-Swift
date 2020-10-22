import Foundation

public struct HwpShapeComponent {
    public var ctrlId: UInt32
}

extension HwpShapeComponent : HwpFromRecord {
    init(_ record: HwpRecord) throws {
        var reader = DataReader(record.payload)
        ctrlId = reader.read(UInt32.self)
    }
}
