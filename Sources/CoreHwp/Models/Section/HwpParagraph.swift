import Foundation

public struct HwpParagraph: HwpFromRecordWithVersion {
    public let paraHeader: HwpParaHeader
    public var paraText: HwpParaText?
    public var paraCharShape: HwpParaCharShape?

    public var paraLineSegArray: [HwpParaLineSeg]?
    public var paraRangeTagArray: [HwpParaRangeTag]?
    public var ctrlHeaderArray: [HwpCtrlHeader]?
    public var listHeaderArray: [HwpListHeader]?

    private enum CodingKeys: String, CodingKey {
        case paraHeader, paraText, paraCharShape
        case paraLineSegArray, paraRangeTagArray
    }

    init() {
        paraHeader =  HwpParaHeader()
        paraText =  HwpParaText()
        paraCharShape =  HwpParaCharShape()
        paraLineSegArray =  [HwpParaLineSeg()]
        paraRangeTagArray =  [HwpParaRangeTag]()
        listHeaderArray =  [HwpListHeader]()
        ctrlHeaderArray =  [HwpCtrlHeader]()
    }

    init(_ record: HwpRecord, _ version: HwpVersion) throws {
        paraHeader = try HwpParaHeader(record.payload, version)

        if let paraText = record.children
            .first(where: {$0.tagId == HwpSectionTag.paraText}) {
            self.paraText = try HwpParaText(paraText.payload)
        }

        if let paraCharShape = record.children
            .first(where: {$0.tagId == HwpSectionTag.paraCharShape}) {
            self.paraCharShape = try HwpParaCharShape(paraCharShape.payload)
        }

        paraLineSegArray = try record.children
            .filter {$0.tagId == HwpSectionTag.paraLineSeg}
            .map {try HwpParaLineSeg($0.payload)}

        paraRangeTagArray = try record.children
            .filter {$0.tagId == HwpSectionTag.paraRangeTag}
            .map {try HwpParaRangeTag($0.payload)}

        ctrlHeaderArray = try record.children
            .filter {$0.tagId == HwpSectionTag.ctrlHeader}
            .map {
                var reader = DataReader($0.payload)
                let ctrlId = reader.read(UInt32.self)
                if let _ = HwpCommonCtrlId.init(rawValue: ctrlId) {
//                    if common == .table {
//                        return try HwpTable($0)
//                    }
                    return try HwpCtrlHeader($0)
                } else if let _ = HwpOtherCtrlId.init(rawValue: ctrlId) {
                    return try HwpCtrlHeader($0)
                } else if let _ = HwpFieldCtrlId.init(rawValue: ctrlId) {
                    return try HwpCtrlHeader($0)
                } else {
                    throw HwpError.invalidCtrlId(ctrlId: 0)
                }
            }

        listHeaderArray = try record.children
            .filter {$0.tagId == HwpSectionTag.listHeader}
            .map { try HwpListHeader($0.payload)}
    }
}
