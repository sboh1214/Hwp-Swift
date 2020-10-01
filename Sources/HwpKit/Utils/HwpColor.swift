import Foundation

public struct HwpColor: Codable, Equatable {
    // swiftlint:disable identifier_name
    public let r: Int
    public let g: Int
    public let b: Int
    // swiftlint:enable identifier_name

    public init(_ data: UInt32) {
        r = getBitValue(Int(data), 0, 7)
        g = getBitValue(Int(data), 0, 7)
        b = getBitValue(Int(data), 0, 7)
    }

    public init(_ red: Int, _ green: Int, _ blue: Int) {
        self.r = red
        self.g = green
        self.b = blue
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
