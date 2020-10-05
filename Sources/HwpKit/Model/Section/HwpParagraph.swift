import Foundation

public struct HwpParagraph: HwpRecordWithVersion {
    public let paraHeader: HwpParaHeader
    public var paraText: HwpParaText? = nil

    init(_ record: HwpTreeRecord, _ version: HwpVersion) throws {
        paraHeader = try HwpParaHeader(record.payload, version)
        
        if let paraText = record.children
                .first(where: {$0.tagId == HwpSectionTag.paraText})
        {
            self.paraText = try HwpParaText(paraText.payload)
        }
    }
}
