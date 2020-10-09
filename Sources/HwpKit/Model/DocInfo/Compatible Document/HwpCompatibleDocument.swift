import Foundation

public struct HwpCompatibleDocument: HwpFromRecord {
    public let targetDocument: UInt32
    public var layoutCompatibility: HwpLayoutCompatibility?

    init(_ record: HwpRecord) throws {
        var reader = DataReader(record.payload)
        defer {
            precondition(reader.isEOF())
        }
        targetDocument = reader.read(UInt32.self)

        if let layoutCompatibility = record.children
            .first(where: {$0.tagId == HwpDocInfoTag.layoutCompatibility}) {
            self.layoutCompatibility = try HwpLayoutCompatibility(layoutCompatibility.payload)
        }
    }
}
