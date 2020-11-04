import Foundation

/**
 호환 문서
 
 Tag ID : HWPTAG_COMPATIBLE_DOCUMENT
 */
public struct HwpCompatibleDocument: HwpFromRecord {
    /**대상 프로그램*/
    public let targetDocument: UInt32
    public let layoutCompatibility: HwpLayoutCompatibility?

    init() {
        targetDocument = 0
        layoutCompatibility = HwpLayoutCompatibility()
    }

    init(_ reader: inout DataReader, _ children: [HwpRecord]) throws {
        targetDocument = reader.read(UInt32.self)

        if let layoutCompatibility = children
            .first(where: {$0.tagId == HwpDocInfoTag.layoutCompatibility.rawValue}) {
            self.layoutCompatibility = try HwpLayoutCompatibility.load(layoutCompatibility.payload)
        } else {
            layoutCompatibility = nil
        }
    }
}
