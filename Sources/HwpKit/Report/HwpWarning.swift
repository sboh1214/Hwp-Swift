import Foundation

public enum HwpWarning: HwpReportable {
    case invalidFileHeaderSignature(signature: String)
    case unidentifiedTag(tagId: UInt32)
}

extension HwpWarning: CustomStringConvertible {
    public var description: String {
        switch self {
        case let .invalidFileHeaderSignature(signature):
            return "Invalid signature in FileHeader stream : get'\(signature)'"
        case let .unidentifiedTag(tagId):
            return "Cannot Read HwpRecord Tag : '\(tagId)'"
        }
    }
}
