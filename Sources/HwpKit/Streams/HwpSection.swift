import Foundation

/**
 본문
 */
public struct HwpSection: HwpDataWithVersion {
    public var paragraph: [HwpParagraph]

    init(_ data: Data, _ version: HwpVersion) throws {
        let records = parseTreeRecord(data: data)
        paragraph = try records.children.map {record in
            precondition(record.tagId == HwpSectionTag.paraHeader)
            return try HwpParagraph(record, version)
        }
    }
}
