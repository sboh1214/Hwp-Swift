import Foundation

public struct HwpIdMappings: HwpFromRecordWithVersion {
    
    public var binDataArray: [HwpBinData]
    public var faceNameArray: [HwpFaceName]
    public var borderFillArray: [HwpBorderFill]
    public var charShapeArray: [HwpCharShape]
    // TODO HWPTAG_TAB_DEF
    // TODO HWPTAG_NUMBERING
    // TODO HWPTAG_BULLET
    public var paraShapeArray: [HwpParaShape]
    
    init(_ record: HwpTreeRecord, _ version: HwpVersion) throws {
        binDataArray = try record.children
            .filter {$0.tagId == HwpDocInfoTag.binData}
            .map {try HwpBinData($0.payload)}
        
        faceNameArray = try record.children
            .filter {$0.tagId == HwpDocInfoTag.faceName}
            .map {try HwpFaceName($0.payload)}
        
        borderFillArray = try record.children
            .filter {$0.tagId == HwpDocInfoTag.borderFill}
            .map {try HwpBorderFill($0.payload)}
        
        charShapeArray = try record.children
            .filter {$0.tagId == HwpDocInfoTag.charShape}
            .map {try HwpCharShape($0.payload, version)}
        
        paraShapeArray = try record.children
            .filter {$0.tagId == HwpDocInfoTag.paraShape}
            .map {try HwpParaShape($0.payload, version)}
    }
}
