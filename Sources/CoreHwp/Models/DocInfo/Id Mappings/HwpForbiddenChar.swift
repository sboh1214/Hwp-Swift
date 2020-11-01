import Foundation

public struct HwpForbiddenChar {
    public let data: Data
}

extension HwpForbiddenChar: HwpFromData {
    init(_ reader: inout DataReader) throws {
        data = reader.readToEnd()
    }
}
