import Foundation

/**
 아이디 매핑 헤더
 
 Tag ID : HWPTAG_ID_MAPPINGS
 */
public struct HwpIdMappings: HwpFromRecordWithVersion {
    /**바이너리 데이터*/
    private let binaryDataCount: Int32
    /**영어 글꼴*/
    private let englishFaceCount: Int32
    /**한자 글꼴*/
    private let chineseFaceCount: Int32
    /**일어 글꼴*/
    private let japaneseFaceCount: Int32
    /**기타 글꼴*/
    private let etcFaceCount: Int32
    /**기호 글꼴*/
    private let symbolFaceCount: Int32
    /**사용자 글꼴*/
    private let userFaceCount: Int32
    /**테두리/배경*/
    private let borderFillCount: Int32
    /**글자 모양*/
    private let charShapeCount: Int32
    /**탭 정의*/
    private let tabDefCount: Int32
    /**문단 번호*/
    private let paraNumberingCount: Int32
    /**글머리표*/
    private let paraHeadCount: Int32
    /**문단 모양*/
    private let paraShapeCount: Int32
    /**스타일*/
    private let styleCount: Int32
    /**메모 모양 (5.0.2.1 이상)*/
    private var memoShapeCount: Int32?
    /**변경추적 (5.0.3.2 이상)*/
    private var changeTraceCount: Int32?
    /**변경추적 사용자 (5.0.3.2 이상)*/
    private var changeTraceUserCount: Int32?

    public var binDataArray: [HwpBinData]
    public var faceNameArray: [HwpFaceName]
    public var borderFillArray: [HwpBorderFill]
    public var charShapeArray: [HwpCharShape]
    // TODO HWPTAG_TAB_DEF
    // TODO HWPTAG_NUMBERING
    // TODO HWPTAG_BULLET
    public var paraShapeArray: [HwpParaShape]

    init() {
        binaryDataCount = 0
        englishFaceCount = 0
        chineseFaceCount = 0
        japaneseFaceCount = 0
        etcFaceCount = 0
        symbolFaceCount = 0
        userFaceCount = 0
        borderFillCount = 0
        charShapeCount = 0
        tabDefCount = 0
        paraNumberingCount = 0
        paraHeadCount = 0
        paraShapeCount = 0
        styleCount = 0

        binDataArray = [HwpBinData]()
        faceNameArray = [HwpFaceName]()
        borderFillArray = [HwpBorderFill]()
        charShapeArray = [HwpCharShape]()
        paraShapeArray = [HwpParaShape]()
    }

    init(_ record: HwpRecord, _ version: HwpVersion) throws {
        var reader = DataReader(record.payload)
        defer {
            // precondition(reader.isEOF())
        }
        binaryDataCount = reader.read(Int32.self)
        englishFaceCount = reader.read(Int32.self)
        chineseFaceCount = reader.read(Int32.self)
        japaneseFaceCount = reader.read(Int32.self)
        etcFaceCount = reader.read(Int32.self)
        symbolFaceCount = reader.read(Int32.self)
        userFaceCount = reader.read(Int32.self)
        borderFillCount = reader.read(Int32.self)
        charShapeCount = reader.read(Int32.self)
        tabDefCount = reader.read(Int32.self)
        paraNumberingCount = reader.read(Int32.self)
        paraHeadCount = reader.read(Int32.self)
        paraShapeCount = reader.read(Int32.self)
        styleCount = reader.read(Int32.self)
        if version >= HwpVersion(5, 0, 2, 1) {
            memoShapeCount = reader.read(Int32.self)
        }
        if version >= HwpVersion(5, 0, 3, 2) {
            changeTraceCount = reader.read(Int32.self)
            changeTraceUserCount = reader.read(Int32.self)
        }

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
