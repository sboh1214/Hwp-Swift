import Foundation

/**
 문서 정보
 
 본문에 사용 중인 글꼴, 글자 속성, 문단 속성, 탭, 스타일 등에 문서 내 공통으로 사용되는 세부 정보를 담고 있다.
 */
public struct HwpDocInfo: HwpData {

    public let documentProperties: HwpDocumentProperties
    public var binDataArray: [HwpBinData]

    init(_ data: Data) throws {
        let records = try parseRecordTree(data: data)

        guard let documentProperties = records
                .first(where: {$0.tagId == HwpDocInfoTag.DOCUMENT_PROPERTIES})
        else {
            throw HwpError.recordDoesNotExist(tag: HwpDocInfoTag.DOCUMENT_PROPERTIES)
        }
        self.documentProperties = HwpDocInfo.visitDocumentPropertes(documentProperties)

        binDataArray = try records
            .filter {$0.tagId == HwpDocInfoTag.BIN_DATA}
            .map {try HwpBinData($0.payload)}
    }

    private static func visitDocumentPropertes(_ record: HwpRecord) -> HwpDocumentProperties {
        return HwpDocumentProperties(record.payload)
    }
}
