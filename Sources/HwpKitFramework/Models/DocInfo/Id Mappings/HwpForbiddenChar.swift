import Foundation

public struct HwpForbiddenChar {
    public let data: Data
}

extension HwpForbiddenChar: HwpFromData {
    init(_ data: Data) throws {
        self.data = data
    }
}
