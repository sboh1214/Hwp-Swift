import Foundation

protocol HwpData: Codable {
    init(_ data: Data) throws
}
