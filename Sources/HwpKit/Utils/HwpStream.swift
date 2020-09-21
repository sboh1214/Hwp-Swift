import Foundation

protocol HwpStream {
    init(_ data: Data, _ report: (HwpReportable) -> Void) throws
}
