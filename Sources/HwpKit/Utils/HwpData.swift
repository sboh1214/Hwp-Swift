import Foundation

protocol HwpData {
    init(_ data: Data, _ report: (HwpReportable) -> Void) throws
}
