import Foundation

public struct HwpChar: HwpPrimitive {
    public let type: HwpCharType
    public let value: WCHAR

    init(type: HwpCharType, value: WCHAR) {
        self.type = type
        self.value = value
    }
}

public enum HwpCharType: String, Codable {
    case char
    case inline
    case extended
}
