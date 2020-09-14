import Foundation

public enum HwpError: Error, Equatable, CustomStringConvertible {
    case InvalidFilePath(path: String)
    case StreamDoesNotExist(name: HKStreamName)
    
    public var description: String {
        switch self {
        case let .InvalidFilePath(path):
            return #"Invalid File Path "\#(path)""#
        case let .StreamDoesNotExist(name):
            return #"Stream "\#(name)" does not exist"#
        }
    }
}
