import Foundation

/**
 아이디 매핑 헤더
 
 Tag ID : HWPTAG_ID_MAPPINGS
 */
public struct HwpIdMappings {
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
    public var tabDefArray: [HwpTabDef]
    public var numberingArray: [HwpNumbering]
    public var bulletArray: [HwpBullet]
    public var paraShapeArray: [HwpParaShape]
}

extension HwpIdMappings: HwpFromRecordWithVersion {
    init() {
        binaryDataCount = 0
        englishFaceCount = 2
        chineseFaceCount = 2
        japaneseFaceCount = 2
        etcFaceCount = 2
        symbolFaceCount = 2
        userFaceCount = 2
        borderFillCount = 2
        charShapeCount = 2
        tabDefCount = 7
        paraNumberingCount = 3
        paraHeadCount = 1
        paraShapeCount = 0
        styleCount = 19
        memoShapeCount = 21
        changeTraceCount = 0
        changeTraceUserCount = 0

        binDataArray = [HwpBinData]()

        // swiftlint:disable line_length
        let dotum = HwpFaceName("함초롬돋움", [2, 11, 6, 4, 0, 1, 1, 1, 1, 1], "HCR Dotum")
        let batang = HwpFaceName("함초롬바탕", [2, 3, 6, 4, 0, 1, 1, 1, 1, 1], "HCR Batang")
        faceNameArray = [dotum, batang, dotum, batang, dotum, batang, dotum, batang, dotum, batang, dotum, batang, dotum, batang]

        let borderFill1 = HwpBorderFill(fillInfo: [0, 0, 0, 0, 0, 0, 0, 0])
        let borderFill2 = HwpBorderFill(fillInfo: [1, 0, 0, 0, 255, 255, 255, 255, 153, 153, 153, 0, 255, 255, 255, 255, 0, 0, 0, 0, 0])
        borderFillArray = [borderFill1, borderFill2]

        let charShape1 = HwpCharShape(faceId: [1, 1, 1, 1, 1, 1, 1], faceSpacing: [0, 0, 0, 0, 0, 0, 0], baseSize: 1000, faceColor: HwpColor())
        let charShape2 = HwpCharShape(faceId: [0, 0, 0, 0, 0, 0, 0], faceSpacing: [0, 0, 0, 0, 0, 0, 0], baseSize: 1000, faceColor: HwpColor())
        let charShape3 = HwpCharShape(faceId: [0, 0, 0, 0, 0, 0, 0], faceSpacing: [0, 0, 0, 0, 0, 0, 0], baseSize: 900, faceColor: HwpColor())
        let charShape4 = HwpCharShape(faceId: [1, 1, 1, 1, 1, 1, 1], faceSpacing: [0, 0, 0, 0, 0, 0, 0], baseSize: 900, faceColor: HwpColor())
        let charShape5 = HwpCharShape(faceId: [0, 0, 0, 0, 0, 0, 0], faceSpacing: [-5, -5, -5, -5, -5, -5, -5], baseSize: 900, faceColor: HwpColor())
        let charShape6 = HwpCharShape(faceId: [0, 0, 0, 0, 0, 0, 0], faceSpacing: [0, 0, 0, 0, 0, 0, 0], baseSize: 1600, faceColor: HwpColor(46, 46, 46))
        let charShape7 = HwpCharShape(faceId: [0, 0, 0, 0, 0, 0, 0], faceSpacing: [0, 0, 0, 0, 0, 0, 0], baseSize: 1100, faceColor: HwpColor())
        charShapeArray = [charShape1, charShape2, charShape3, charShape4, charShape5, charShape6, charShape7]

        tabDefArray = [HwpTabDef(property: 0), HwpTabDef(property: 1), HwpTabDef(property: 2)]

        numberingArray = [HwpNumbering(formatArray: [HwpNumberingFormat(property: [12, 0, 0, 0, 0, 0, 50, 0, 255, 255, 255, 255], formatLength: 3, format: "^1."), HwpNumberingFormat(property: [12, 1, 0, 0, 0, 0, 50, 0, 255, 255, 255, 255], formatLength: 3, format: "^2."), HwpNumberingFormat(property: [12, 0, 0, 0, 0, 0, 50, 0, 255, 255, 255, 255], formatLength: 3, format: "^3)"), HwpNumberingFormat(property: [12, 1, 0, 0, 0, 0, 50, 0, 255, 255, 255, 255], formatLength: 3, format: "^4)"), HwpNumberingFormat(property: [12, 0, 0, 0, 0, 0, 50, 0, 255, 255, 255, 255], formatLength: 4, format: "(^5)"), HwpNumberingFormat(property: [12, 1, 0, 0, 0, 0, 50, 0, 255, 255, 255, 255], formatLength: 4, format: "(^6)"), HwpNumberingFormat(property: [44, 0, 0, 0, 0, 0, 50, 0, 255, 255, 255, 255], formatLength: 2, format: "^7")], startingIndex: 0, startingIndexArray: Optional([1, 1, 1, 1, 1, 1, 1]), extendedFormatArray: Optional([HwpNumberingFormat(property: [8, 0, 0, 0, 0, 0, 50, 0, 255, 255, 255, 255], formatLength: 0, format: ""), HwpNumberingFormat(property: [8, 0, 0, 0, 0, 0, 50, 0, 255, 255, 255, 255], formatLength: 0, format: ""), HwpNumberingFormat(property: [8, 0, 0, 0, 0, 0, 50, 0, 255, 255, 255, 255], formatLength: 0, format: "")]), extendedStartingIndexArray: Optional([1, 1, 1]))]

        bulletArray = [HwpBullet]()

        let paraShape1 = HwpParaShape(property1: 384, marginLeft: 0, paragraphSpacingBottom: 0, tabDefId: 0)
        let paraShape2 = HwpParaShape(property1: 384, marginLeft: 3000, paragraphSpacingBottom: 0, tabDefId: 0)
        paraShapeArray = [paraShape1, paraShape2, HwpParaShape(property1: 8399232, marginLeft: 2000, paragraphSpacingBottom: 0, tabDefId: 1), HwpParaShape(property1: 41953664, marginLeft: 4000, paragraphSpacingBottom: 0, tabDefId: 1), HwpParaShape(property1: 75508096, marginLeft: 6000, paragraphSpacingBottom: 0, tabDefId: 1), HwpParaShape(property1: 109062528, marginLeft: 8000, paragraphSpacingBottom: 0, tabDefId: 1), HwpParaShape(property1: 142616960, marginLeft: 10000, paragraphSpacingBottom: 0, tabDefId: 1), HwpParaShape(property1: 176171392, marginLeft: 12000, paragraphSpacingBottom: 0, tabDefId: 1), HwpParaShape(property1: 209725824, marginLeft: 14000, paragraphSpacingBottom: 0, tabDefId: 1), HwpParaShape(property1: 256, marginLeft: 0, paragraphSpacingBottom: 0, lineSpacing: 150, tabDefId: 0, lineSpacing2: Optional(150)), HwpParaShape(property1: 384, marginLeft: 0, indent: -2620, paragraphSpacingBottom: 0, lineSpacing: 130, tabDefId: 0, lineSpacing2: Optional(130)), HwpParaShape(property1: 260, marginLeft: 0, paragraphSpacingBottom: 0, lineSpacing: 130, tabDefId: 0, lineSpacing2: Optional(130)), HwpParaShape(property1: 10500, marginLeft: 0, paragraphSpacingTop: 2400, paragraphSpacingBottom: 600, tabDefId: 1), HwpParaShape(property1: 260, marginLeft: 0, paragraphSpacingBottom: 1400, tabDefId: 2), HwpParaShape(property1: 260, marginLeft: 2200, paragraphSpacingBottom: 1400, tabDefId: 2), HwpParaShape(property1: 260, marginLeft: 4400, paragraphSpacingBottom: 1400, tabDefId: 2), HwpParaShape(property1: 209715584, marginLeft: 18000, paragraphSpacingBottom: 0, tabDefId: 1), HwpParaShape(property1: 209715584, marginLeft: 20000, paragraphSpacingBottom: 0, tabDefId: 1), HwpParaShape(property1: 209715584, marginLeft: 16000, paragraphSpacingBottom: 0, tabDefId: 1)]
        // swiftlint:enable line_length
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

        tabDefArray = try record.children
            .filter {$0.tagId == HwpDocInfoTag.tabDef}
            .map {try HwpTabDef($0.payload)}

        numberingArray = try record.children
            .filter {$0.tagId == HwpDocInfoTag.numbering}
            .map {try HwpNumbering($0.payload, version)}

        bulletArray = try record.children
            .filter {$0.tagId == HwpDocInfoTag.bullet}
            .map {try HwpBullet($0.payload)}

        paraShapeArray = try record.children
            .filter {$0.tagId == HwpDocInfoTag.paraShape}
            .map {try HwpParaShape($0.payload, version)}
    }
}
