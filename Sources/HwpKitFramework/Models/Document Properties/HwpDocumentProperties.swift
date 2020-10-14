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

   init(_ data: Data) {
        var reader = DataReader(data)
        sectionSize = reader.read(UInt16.self)
        startingIndex = HwpStartingIndex(reader.readBytes(12))
        caratLocation = HwpCaratLocation(reader.readBytes(12))
    }
}
