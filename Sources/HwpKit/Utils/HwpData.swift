import Foundation

protocol HwpData: Codable {
    init(_ data: Data) throws
}

protocol HwpDataWithVersion: Codable {
    init(_ data: Data, _ version: HwpVersion) throws
}

protocol HwpRecordWithVersion: Codable {
    init(_ record: HwpTreeRecord, _ version: HwpVersion) throws
}
