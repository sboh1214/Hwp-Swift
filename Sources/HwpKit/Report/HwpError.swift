import Foundation

public enum HwpError: Error {
    case invalidReport(report: HwpReportable)
    case invalidFilePath(path: String)
    case streamDoesNotExist(name: HwpStreamName)
}

extension HwpError: CustomStringConvertible {
    public var description: String {
        switch self {
        case let .invalidReport(report):
            return "Invalid HwpReportable '\(report)'"
        case let .invalidFilePath(path):
            return "Invalid File Path '\(path)'"
        case let .streamDoesNotExist(name):
            return "Stream '\(name)' does not exist"
        }
    }
}
