import Foundation

public struct HwpDocInfo: HwpData {

    let record: HwpRecord
    let documentProperties: HwpDocumentProperties

    init(_ data: Data) throws {
        record = try parseRecordTree(data: data)

        guard let documentProperties = record.children.first(where: { $0.tagID == HwpDocInfoTag.DOCUMENT_PROPERTIES })
        else {
            throw HwpError.recordDoesNotExist(tag: HwpDocInfoTag.DOCUMENT_PROPERTIES)
        }
        self.documentProperties = HwpDocInfo.visitDocumentPropertes(documentProperties)
    }

    private static func visitDocumentPropertes(_ record: HwpRecord) -> HwpDocumentProperties {
        return HwpDocumentProperties(record.payload)
    }
}
