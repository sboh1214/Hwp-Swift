import Foundation

public enum HwpError: Error, Equatable, CustomStringConvertible {
    case invalidFilePath(path: String)
    case streamDoesNotExist(name: HwpStreamName)

    public var description: String {
        switch self {
        case let .invalidFilePath(path):
            return #"Invalid File Path "\#(path)""#
        case let .streamDoesNotExist(name):
            return #"Stream "\#(name)" does not exist"#
    }
}
}
