import Foundation

public struct HwpDocumentProperties: HwpFromData {
    public let sectionSize: UInt16
    public let startingIndex: HwpStartingIndex
    public let caratLocation: HwpCaratLocation

    init(_ data: Data) {
        var reader = DataReader(data)
        sectionSize = reader.read(UInt16.self)
        startingIndex = HwpStartingIndex(reader.readBytes(12))
        caratLocation = HwpCaratLocation(reader.readBytes(12))
    }
}
