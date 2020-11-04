import Foundation

/**
 본문
 */
public struct HwpSection: HwpFromDataWithVersion {
    public var paragraph: [HwpParagraph]

    init() {
        paragraph = [HwpParagraph()]
    }

    init(_ reader: inout DataReader, _ version: HwpVersion) throws {
        let records = parseTreeRecord(data: reader.readToEnd())
        paragraph = try records.children.map {record in
            precondition(record.tagId == HwpSectionTag.paraHeader.rawValue)
            return try HwpParagraph.load(record, version)
        }
    }
}
