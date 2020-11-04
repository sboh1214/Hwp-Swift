import Foundation

/**
 문서 속성
 
 Tag ID : HWPTAG_DOCUMENT_PROPERTIES
 */
public struct HwpDocumentProperties: HwpFromData {
    /**구역 개수*/
    public var sectionSize: UInt16
    public let startingIndex: HwpStartingIndex
    public let caratLocation: HwpCaratLocation

    init() {
        sectionSize = 1
        startingIndex = HwpStartingIndex()
        caratLocation = HwpCaratLocation()
    }

    init(_ reader: inout DataReader) throws {
        sectionSize = reader.read(UInt16.self)
        startingIndex = try HwpStartingIndex.load(reader.readBytes(12))
        caratLocation = try HwpCaratLocation.load(reader.readBytes(12))
    }
}
