import Foundation

public struct HwpDocumentProperties: HwpData {
    let sectionSize: UInt16
    let startingIndex: HwpStartingIndex
    let caratLocation: HwpCaratLocation

    init(_ data: Data) {
        var reader = DataReader(data)
        sectionSize = reader.readUInt16()
        startingIndex = HwpStartingIndex(reader.readBytes(12))
        caratLocation = HwpCaratLocation(reader.readBytes(12))
    }
}
