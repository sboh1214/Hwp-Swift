import Foundation

public enum HwpError: Error {
    case invalidReport(report: HwpReportable)
    case invalidFilePath(path: String)
    case streamDoesNotExist(name: HwpStreamName)
    case invalidDataForString(data: Data, name: String)
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
        case let .invalidDataForString(data, name):
            return
                """
               Cannot covert data to utf16le string
               data: '\(data)'
               name: '\(name)'
               """
        }
    }
}
