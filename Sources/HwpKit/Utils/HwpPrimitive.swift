import Foundation

protocol HwpPrimitive: Hashable, Codable {}

protocol HwpFromData: HwpPrimitive {
    init(_ data: Data) throws
}

protocol HwpFromDataWithVersion: HwpPrimitive {
    init(_ data: Data, _ version: HwpVersion) throws
}

protocol HwpFromRecord: HwpPrimitive {
    init(_ record: HwpRecord) throws
}

protocol HwpFromRecordWithVersion: HwpPrimitive {
    init(_ record: HwpRecord, _ version: HwpVersion) throws
}
