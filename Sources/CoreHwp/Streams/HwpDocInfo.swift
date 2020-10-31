import Foundation

/**
 문서 정보
 
 본문에 사용 중인 글꼴, 글자 속성, 문단 속성, 탭, 스타일 등에 문서 내 공통으로 사용되는 세부 정보를 담고 있다.
 */
public struct HwpDocInfo: HwpFromDataWithVersion {
    public let documentProperties: HwpDocumentProperties
    public let idMappings: HwpIdMappings

    // TODO HWPTAG_STYLE
    // TODO HWPTAG_DOC_DATA
    // HWPTAG_DISTRIBUTE_DOC_DATA
    public var compatibleDocument: HwpCompatibleDocument?
    // TODO HWPTAG_LAYOUT_COMPATIBILITY

    init() {
        documentProperties = HwpDocumentProperties()
        idMappings = HwpIdMappings()
        compatibleDocument = HwpCompatibleDocument()
    }

    init(_ data: Data, _ version: HwpVersion) throws {
        let record = parseTreeRecord(data: data)

        guard let documentProperties = record.children
                .first(where: {$0.tagId == HwpDocInfoTag.documentProperties.rawValue})
        else {
            throw HwpError.recordDoesNotExist(tag: HwpDocInfoTag.documentProperties.rawValue)
        }
        self.documentProperties = try HwpDocumentProperties(documentProperties.payload)

        guard let idMappings = record.children
                .first(where: {$0.tagId == HwpDocInfoTag.idMappings.rawValue})
        else {
            throw HwpError.recordDoesNotExist(tag: HwpDocInfoTag.idMappings.rawValue)
        }
        self.idMappings = try HwpIdMappings(idMappings, version)

        if let compatibleDocument = record.children
            .first(where: {$0.tagId == HwpDocInfoTag.compatibleDocument.rawValue}) {
            self.compatibleDocument = try HwpCompatibleDocument(compatibleDocument)
        }
    }
}
