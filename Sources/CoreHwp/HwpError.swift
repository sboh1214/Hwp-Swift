import Foundation

public enum HwpError: Error {
    case streamDoesNotExist(name: HwpStreamName)
    case streamDecompressFailed(name: HwpStreamName)
    case invalidDataForString(data: Data, name: String)
    case recordDoesNotExist(tag: UInt32)
    case invalidFileHeaderSignature(signature: String)
    case unidentifiedTag(tagId: UInt32)
    case invalidCtrlId(ctrlId: UInt32)
    case bytesAreNotEOF(model: Any, remain: Int)
    case bitsAreNotEOF(model: Any, remain: Int)
    case invalidRawValueForEnum(model: Any, rawValue: Int)
}

extension HwpError: CustomStringConvertible {
    public var description: String {
        switch self {
        case let .streamDoesNotExist(name):
            return "Stream '\(name)' does not exist"
        case let .streamDecompressFailed(name):
            return "Stream '\(name)' failed to decompress"
        case let .invalidDataForString(data, name):
            return
                """
                Cannot covert data to utf16le string
                data: '\(data)'
                name: '\(name)'
                """
        case let .recordDoesNotExist(tag):
            return "Record '\(tag)' does not exist."
        case let .invalidFileHeaderSignature(signature):
            return "Invalid signature in FileHeader stream : get'\(signature)'"
        case let .unidentifiedTag(tagId):
            return "Cannot Read HwpRecord Tag : '\(tagId)'"
        case let .invalidCtrlId(ctrlId):
            return "Invalid Ctrl Id in HwpParagraph : '\(ctrlId)'"
        case let .bytesAreNotEOF(model, remain):
            let typeOfModel = String(describing: type(of: model))
            return "Bytes are not EOF : \(remain) bytes remain in \(typeOfModel)"
        case let .bitsAreNotEOF(model, remain):
            let typeOfModel = String(describing: type(of: model))
            return "Bits are not EOF : \(remain) bits remain in \(typeOfModel)"
        case let .invalidRawValueForEnum(model, rawValue):
            let typeOfModel = String(describing: type(of: model))
            return "Invalid rawValue : \(rawValue) for initiating enum : \(typeOfModel)"
        }
    }
}
