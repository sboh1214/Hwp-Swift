import Foundation

public struct HwpParagraph: HwpRecordWithVersion {
    public let paraHeader: HwpParaHeader
    public var paraText: HwpParaText?
    public var paraCharShape: HwpParaCharShape?

    public var paraLineSeg: [HwpParaLineSeg]?
    public var paraRangeTag: [HwpParaRangeTag]?

    init(_ record: HwpTreeRecord, _ version: HwpVersion) throws {
        paraHeader = try HwpParaHeader(record.payload, version)

        if let paraText = record.children
                .first(where: {$0.tagId == HwpSectionTag.paraText}) {
            self.paraText = try HwpParaText(paraText.payload)
        }

        if let paraCharShape = record.children
            .first(where: {$0.tagId == HwpSectionTag.paraCharShape}) {
            self.paraCharShape = try HwpParaCharShape(paraCharShape.payload)
        }

        paraLineSeg = try record.children
            .filter {$0.tagId == HwpSectionTag.paraLineSeg}
            .map {try HwpParaLineSeg($0.payload)}

        paraRangeTag = try record.children
            .filter {$0.tagId == HwpSectionTag.paraRangeTag}
            .map {try HwpParaRangeTag($0.payload)}
    }
}
