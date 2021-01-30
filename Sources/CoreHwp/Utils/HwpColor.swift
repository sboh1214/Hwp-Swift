import Foundation

public struct HwpColor: HwpPrimitive {
    public let red: Int
    public let green: Int
    public let blue: Int
}

extension HwpColor {
    init() {
        red = 0
        green = 0
        blue = 0
    }

    public init(_ data: COLORREF) {
        var reader = BitsReader(from: data)
        // reader.readBits(8)
        red = reader.readInt(8)
        green = reader.readInt(8)
        blue = reader.readInt(8)
    }

    public init(_ red: Int, _ green: Int, _ blue: Int) {
        self.red = red
        self.green = green
        self.blue = blue
    }
}
