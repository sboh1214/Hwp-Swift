import Foundation

public enum HwpWarning: HwpReportable {
    case invalidFileHeaderSignature(signature: String)
}

extension HwpWarning: CustomStringConvertible {
    public var description: String {
        switch self {
        case let .invalidFileHeaderSignature(signature):
            return #"Invalid signature in FileHeader stream : get"\#(signature)""#
        }
    }
}
