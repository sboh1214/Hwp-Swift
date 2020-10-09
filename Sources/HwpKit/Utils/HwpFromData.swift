import Foundation

protocol HwpFromData: Codable {
    init(_ data: Data) throws
}

protocol HwpFromDataWithVersion: Codable {
    init(_ data: Data, _ version: HwpVersion) throws
}

protocol HwpFromRecord: Codable {
    init(_ record: HwpRecord) throws 
}

protocol HwpFromRecordWithVersion: Codable {
    init(_ record: HwpRecord, _ version: HwpVersion) throws
}
