import Foundation

public struct HwpCaratLocation: HwpData {
    public let listId: UInt32
    public let paragraphId: UInt32
    public let charIndex: UInt32

    init(_ data: Data) {
        var reader = DataReader(data)
        listId = reader.read(UInt32.self)
        paragraphId = reader.read(UInt32.self)
        charIndex = reader.read(UInt32.self)
    }
}
