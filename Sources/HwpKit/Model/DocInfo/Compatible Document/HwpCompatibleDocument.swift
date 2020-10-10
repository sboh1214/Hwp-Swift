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

    init(_ record: HwpRecord) throws {
        var reader = DataReader(record.payload)
        defer {
            precondition(reader.isEOF())
        }
        targetDocument = reader.read(UInt32.self)

        if let layoutCompatibility = record.children
            .first(where: {$0.tagId == HwpDocInfoTag.layoutCompatibility}) {
            self.layoutCompatibility = try HwpLayoutCompatibility(layoutCompatibility.payload)
        } else {
            layoutCompatibility = nil
        }
    }
}
