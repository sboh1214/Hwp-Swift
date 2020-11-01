import Foundation

public struct HwpParagraph: HwpFromRecordWithVersion {
    public let paraHeader: HwpParaHeader
    public var paraText: HwpParaText?
    public var paraCharShape: HwpParaCharShape?

    public var paraLineSegArray: [HwpParaLineSeg]?
    public var paraRangeTagArray: [HwpParaRangeTag]?
    public var ctrlHeaderArray: [HwpCtrlId]?
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
        ctrlHeaderArray =  [HwpCtrlId]()
    }

    init(_ record: HwpRecord, _ version: HwpVersion) throws {
        paraHeader = try HwpParaHeader.load(record.payload, version)

        if let paraText = record.children
            .first(where: {$0.tagId == HwpSectionTag.paraText.rawValue}) {
            self.paraText = try HwpParaText.load(paraText.payload)
        }

        if let paraCharShape = record.children
            .first(where: {$0.tagId == HwpSectionTag.paraCharShape.rawValue}) {
            self.paraCharShape = try HwpParaCharShape.load(paraCharShape.payload)
        }

        paraLineSegArray = try record.children
            .filter {$0.tagId == HwpSectionTag.paraLineSeg.rawValue}
            .map {try HwpParaLineSeg.load($0.payload)}

        paraRangeTagArray = try record.children
            .filter {$0.tagId == HwpSectionTag.paraRangeTag.rawValue}
            .map {try HwpParaRangeTag.load($0.payload)}

        ctrlHeaderArray = try record.children
            .filter {$0.tagId == HwpSectionTag.ctrlHeader.rawValue}
            .map {
                var reader = DataReader($0.payload)
                let ctrlId = reader.read(UInt32.self)
                if let common = HwpCommonCtrlId.init(rawValue: ctrlId) {
                    if common == .table {
                        return try .table(HwpTable($0))
                    } else if common == .genShapeObject {
                        return try .genShapeObject(HwpGenShapeObject($0))
                    }
                    return try .notImplemented(HwpCtrlHeader($0))
                } else if let other = HwpOtherCtrlId.init(rawValue: ctrlId) {
                    if other == .column {
                        return try .column(HwpColumn.load($0.payload))
                    }
                    return try .notImplemented(HwpCtrlHeader($0))
                } else if HwpFieldCtrlId.init(rawValue: ctrlId) != nil {
                    return try .notImplemented(HwpCtrlHeader($0))
                } else {
                    throw HwpError.invalidCtrlId(ctrlId: 0)
                }
            }

        listHeaderArray = try record.children
            .filter {$0.tagId == HwpSectionTag.listHeader.rawValue}
            .map { try HwpListHeader.load($0.payload)}
    }
}
