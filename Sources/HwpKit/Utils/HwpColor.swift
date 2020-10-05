import Foundation

public struct HwpColor: Codable, Equatable {
    // swiftlint:disable identifier_name
    public let red: Int
    public let green: Int
    public let blue: Int
    // swiftlint:enable identifier_name

    public init(_ data: UInt32) {
        red = getBitValue(Int(data), 0, 7)
        green = getBitValue(Int(data), 0, 7)
        blue = getBitValue(Int(data), 0, 7)
    }

    public init(_ red: Int, _ green: Int, _ blue: Int) {
        self.red = red
        self.green = green
        self.blue = blue
    }
}

func getBitValue(_ mask: Int, _ start: Int, _ end: Int) -> Int {
    let target: Int = mask >> start

    var temp = 0
    for _ in  0...(end - start) {
        temp <<= 1
        temp += 1
    }

    return target & temp
}
