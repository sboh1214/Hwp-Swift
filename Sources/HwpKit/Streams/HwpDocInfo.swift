import Foundation

struct HwpDocInfo: HwpStream {
    let record: HwpRecord
    var documentProperties: HwpDocumentProperties

    init(_ data: Data, _ report: (HwpReportable) -> Void) throws {
        record = try parseRecordTree(data: data)

        record.children.forEach { item in visitRecord(item, report) }
    }

    private mutating func visitRecord(_ record: HwpRecord, _ report: (HwpReportable) -> Void) {
        switch record.tagID {
        case HwpDocInfoTag.DOCUMENT_PROPERTIES:
            visitDocumentPropertes(record)
        default:
            report(HwpWarning.unidentifiedTag(tagId: record.tagID))
        }
    }

    private mutating func visitDocumentPropertes(_ record: HwpRecord) {
        var reader = DataReader(record.payload)
        let sectionSize = reader.readUInt16()
        documentProperties = HwpDocumentProperties(sectionSize: sectionSize)
    }
}
