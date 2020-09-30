import Foundation

protocol HwpDataWithVersion: Codable {
    init(_ data: Data, _ version: HwpVersion) throws
}
