import Foundation

public struct HwpParagraph: HwpFromRecordWithVersion {
    public let paraHeader: HwpParaHeader

    public var paraText: HwpParaText?
    public var paraCharShape: HwpParaCharShape
    public var paraLineSeg: HwpParaLineSeg
    public var ctrlHeaderArray: [HwpCtrlId]?
    public var paraRangeTagArray: [HwpParaRangeTag]?
    public var listHeaderArray: [HwpListHeader]?

    init() {
        paraHeader =  HwpParaHeader()
        paraText =  HwpParaText()
        paraCharShape =  HwpParaCharShape()
        paraLineSeg =  HwpParaLineSeg()
        paraRangeTagArray =  [HwpParaRangeTag]()
        listHeaderArray =  [HwpListHeader]()
        ctrlHeaderArray =  [
            .section(HwpSectionDef()),
            .column(HwpColumn())
        ]
    }

    // swiftlint:disable cyclomatic_complexity
    // swiftlint:disable function_body_length
    init(_ reader: inout DataReader, _ children: [HwpRecord], _ version: HwpVersion) throws {
        paraHeader = try HwpParaHeader.load(reader.readToEnd(), version)

        if let paraText = children
            .first(where: {$0.tagId == HwpSectionTag.paraText.rawValue}) {
            self.paraText = try HwpParaText.load(paraText.payload)
        }

        guard let paraCharShape = children
            .first(where: {$0.tagId == HwpSectionTag.paraCharShape.rawValue}) else {
            throw HwpError.recordDoesNotExist(tag: HwpSectionTag.paraCharShape.rawValue)
        }
        self.paraCharShape = try HwpParaCharShape.load(paraCharShape.payload)

        guard let paraLineSeg = children
            .first(where: {$0.tagId == HwpSectionTag.paraLineSeg.rawValue}) else {
            throw HwpError.recordDoesNotExist(tag: HwpSectionTag.paraLineSeg.rawValue)
        }
        self.paraLineSeg = try HwpParaLineSeg.load(paraLineSeg.payload)

        paraRangeTagArray = try children
            .filter {$0.tagId == HwpSectionTag.paraRangeTag.rawValue}
            .map {try HwpParaRangeTag.load($0.payload)}

        ctrlHeaderArray = try children
            .filter {$0.tagId == HwpSectionTag.ctrlHeader.rawValue}
            .map {
                var reader = DataReader($0.payload)
                let ctrlId = reader.read(UInt32.self)
                if let common = HwpCommonCtrlId.init(rawValue: ctrlId) {
                    if common == .table {
                        return try .table(HwpTable.load($0, version))
                    } else if common == .genShapeObject {
                        return try .genShapeObject(HwpGenShapeObject.load($0))
                    }
                    return try .notImplemented(HwpCtrlHeader.load($0))
                } else if let other = HwpOtherCtrlId.init(rawValue: ctrlId) {
                    if other == .column {
                        return try .column(HwpColumn.load($0.payload))
                    } else if other == .section {
                        return try .section(HwpSectionDef.load($0, version))
                    } else if other == .pageNumberPosition {
                        return try .pageNumberPosition(HwpPageNumberPosition.load($0.payload))
                    }
                    print(other)
                    return try .notImplemented(HwpCtrlHeader.load($0))
                } else if HwpFieldCtrlId.init(rawValue: ctrlId) != nil {
                    return try .notImplemented(HwpCtrlHeader.load($0))
                } else {
                    throw HwpError.invalidCtrlId(ctrlId: 0)
                }
            }

        listHeaderArray = try children
            .filter {$0.tagId == HwpSectionTag.listHeader.rawValue}
            .map { try HwpListHeader.load($0.payload)}
    }
}
