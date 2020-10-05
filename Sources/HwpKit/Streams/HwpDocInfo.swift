import Foundation

/**
 문서 정보
 
 본문에 사용 중인 글꼴, 글자 속성, 문단 속성, 탭, 스타일 등에 문서 내 공통으로 사용되는 세부 정보를 담고 있다.
 */
public struct HwpDocInfo: HwpDataWithVersion {

    public let documentProperties: HwpDocumentProperties
    public var binDataArray: [HwpBinData]
    public var faceNameArray: [HwpFaceName]
    public var borderFillArray: [HwpBorderFill]
    public var charShapeArray: [HwpCharShape]
    // TODO HWPTAG_TAB_DEF
    // TODO HWPTAG_NUMBERING
    // TODO HWPTAG_BULLET
    public var paraShapeArray: [HwpParaShape]
    // TODO HWPTAG_STYLE
    // TODO HWPTAG_DOC_DATA
    // HWPTAG_DISTRIBUTE_DOC_DATA
    // TODO HWPTAG_COMPATIBLE_DOCUMENT
    // TODO HWPTAG_LAYOUT_COMPATIBILITY

    init(_ data: Data, _ version: HwpVersion) throws {
        let records = try parseRecordArray(data: data)

        guard let documentProperties = records
                .first(where: {$0.tagId == HwpDocInfoTag.documentProperties})
        else {
            throw HwpError.recordDoesNotExist(tag: HwpDocInfoTag.documentProperties)
        }
        self.documentProperties = HwpDocInfo.visitDocumentPropertes(documentProperties)

        binDataArray = try records
            .filter {$0.tagId == HwpDocInfoTag.binData}
            .map {try HwpBinData($0.payload)}

        faceNameArray = try records
            .filter {$0.tagId == HwpDocInfoTag.faceName}
            .map {try HwpFaceName($0.payload)}

        borderFillArray = try records
            .filter {$0.tagId == HwpDocInfoTag.borderFill}
            .map {try HwpBorderFill($0.payload)}

        charShapeArray = try records
            .filter {$0.tagId == HwpDocInfoTag.charShape}
            .map {try HwpCharShape($0.payload, version)}

        paraShapeArray = try records
            .filter {$0.tagId == HwpDocInfoTag.paraShape}
            .map {try HwpParaShape($0.payload, version)}
    }

    private static func visitDocumentPropertes(_ record: HwpRecord) -> HwpDocumentProperties {
        return HwpDocumentProperties(record.payload)
    }
}
