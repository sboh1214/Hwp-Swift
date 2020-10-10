import Foundation

protocol HwpPrimitive: Hashable, Codable {}

protocol HwpFromData: HwpPrimitive {
    init()
    init(_ data: Data) throws
}

protocol HwpFromDataWithVersion: HwpPrimitive {
    init()
    init(_ data: Data, _ version: HwpVersion) throws
}

protocol HwpFromRecord: HwpPrimitive {
    init()
    init(_ record: HwpRecord) throws
}

protocol HwpFromRecordWithVersion: HwpPrimitive {
    init()
    init(_ record: HwpRecord, _ version: HwpVersion) throws
}
