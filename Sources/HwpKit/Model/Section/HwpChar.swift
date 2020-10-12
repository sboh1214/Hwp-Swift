import Foundation

public struct HwpChar: HwpPrimitive {
    public let type: HwpCharType
    public let value: WCHAR

    init(type: HwpCharType, value: WCHAR) {
        self.type = type
        self.value = value
    }
}
