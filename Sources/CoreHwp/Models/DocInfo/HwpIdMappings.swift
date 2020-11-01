import Foundation

/**
 아이디 매핑 헤더
 
 Tag ID : HWPTAG_ID_MAPPINGS
 */
public struct HwpIdMappings {
    /**바이너리 데이터*/
    public let binaryDataCount: Int32
    /**한글 글꼴*/
    public let faceNameKoreanCount: Int32
    /**영어 글꼴*/
    public let faceNameEnglishCount: Int32
    /**한자 글꼴*/
    public let faceNameChineseCount: Int32
    /**일어 글꼴*/
    public let faceNameJapaneseCount: Int32
    /**기타 글꼴*/
    public let faceNameEtcCount: Int32
    /**기호 글꼴*/
    public let faceNameSymbolCount: Int32
    /**사용자 글꼴*/
    public let faceNameUserCount: Int32
    /**테두리/배경*/
    public let borderFillCount: Int32
    /**글자 모양*/
    public let charShapeCount: Int32
    /**탭 정의*/
    public let tabDefCount: Int32
    /**문단 번호*/
    public let numberingCount: Int32
    /**글머리표*/
    public let bulletCount: Int32
    /**문단 모양*/
    public let paraShapeCount: Int32
    /**스타일*/
    public let styleCount: Int32
    /**메모 모양 (5.0.2.1 이상)*/
    public var memoShapeCount: Int32?
    /**변경추적 (5.0.3.2 이상)*/
    public var changeTraceCount: Int32?
    /**변경추적 사용자 (5.0.3.2 이상)*/
    public var changeTraceUserCount: Int32?

    public var binDataArray: [HwpBinData]

    public var faceNameKoreanArray: [HwpFaceName]
    public var faceNameEnglishArray: [HwpFaceName]
    public var faceNameChineseArray: [HwpFaceName]
    public var faceNameJapaneseArray: [HwpFaceName]
    public var faceNameEtcArray: [HwpFaceName]
    public var faceNameSymbolArray: [HwpFaceName]
    public var faceNameUserArray: [HwpFaceName]

    public var borderFillArray: [HwpBorderFill]
    public var charShapeArray: [HwpCharShape]
    public var tabDefArray: [HwpTabDef]
    public var numberingArray: [HwpNumbering]
    public var bulletArray: [HwpBullet]
    public var paraShapeArray: [HwpParaShape]
    public var styleArray: [HwpStyle]
    /**
     금칙처리문자
     
     NOTE : 문서화되어있지 않음
     */
    public var forbiddenCharArray: [HwpForbiddenChar]
}

extension HwpIdMappings: HwpFromRecordWithVersion {
    // swiftlint:disable function_body_length
    init() {
        charShapeCount = 2
        tabDefCount = 7
        numberingCount = 3
        bulletCount = 1
        paraShapeCount = 0
        styleCount = 19
        memoShapeCount = 21
        changeTraceCount = 0
        changeTraceUserCount = 0

        binDataArray = [HwpBinData]()
        binaryDataCount = Int32(binDataArray.count)

        let dotum = HwpFaceName("함초롬돋움", [2, 11, 6, 4, 0, 1, 1, 1, 1, 1], "HCR Dotum")
        let batang = HwpFaceName("함초롬바탕", [2, 3, 6, 4, 0, 1, 1, 1, 1, 1], "HCR Batang")

        faceNameKoreanArray = [dotum, batang]
        faceNameKoreanCount = Int32(faceNameKoreanArray.count)

        faceNameEnglishArray = [dotum, batang]
        faceNameEnglishCount = Int32(faceNameEnglishArray.count)

        faceNameChineseArray = [dotum, batang]
        faceNameChineseCount = Int32(faceNameChineseArray.count)

        faceNameJapaneseArray = [dotum, batang]
        faceNameJapaneseCount = Int32(faceNameJapaneseArray.count)

        faceNameEtcArray = [dotum, batang]
        faceNameEtcCount = Int32(faceNameEtcArray.count)

        faceNameSymbolArray = [dotum, batang]
        faceNameSymbolCount = Int32(faceNameSymbolArray.count)

        faceNameUserArray = [dotum, batang]
        faceNameUserCount = Int32(faceNameUserArray.count)

        // swiftlint:disable line_length
        borderFillArray = [
            HwpBorderFill(fillInfo: [0, 0, 0, 0, 0, 0, 0, 0]),
            HwpBorderFill(fillInfo: [1, 0, 0, 0, 255, 255, 255, 255, 153, 153, 153, 0, 255, 255, 255, 255, 0, 0, 0, 0, 0])
        ]
        borderFillCount = Int32(borderFillArray.count)

        charShapeArray = [
            HwpCharShape(faceId: [1, 1, 1, 1, 1, 1, 1], faceSpacing: [0, 0, 0, 0, 0, 0, 0], baseSize: 1000, faceColor: HwpColor()),
            HwpCharShape(faceId: [0, 0, 0, 0, 0, 0, 0], faceSpacing: [0, 0, 0, 0, 0, 0, 0], baseSize: 1000, faceColor: HwpColor()),
            HwpCharShape(faceId: [0, 0, 0, 0, 0, 0, 0], faceSpacing: [0, 0, 0, 0, 0, 0, 0], baseSize: 900, faceColor: HwpColor()),
            HwpCharShape(faceId: [1, 1, 1, 1, 1, 1, 1], faceSpacing: [0, 0, 0, 0, 0, 0, 0], baseSize: 900, faceColor: HwpColor()),
            HwpCharShape(faceId: [0, 0, 0, 0, 0, 0, 0], faceSpacing: [-5, -5, -5, -5, -5, -5, -5], baseSize: 900, faceColor: HwpColor()),
            HwpCharShape(faceId: [0, 0, 0, 0, 0, 0, 0], faceSpacing: [0, 0, 0, 0, 0, 0, 0], baseSize: 1600, faceColor: HwpColor(46, 46, 46)),
            HwpCharShape(faceId: [0, 0, 0, 0, 0, 0, 0], faceSpacing: [0, 0, 0, 0, 0, 0, 0], baseSize: 1100, faceColor: HwpColor())
        ]

        tabDefArray = [HwpTabDef(property: 0), HwpTabDef(property: 1), HwpTabDef(property: 2)]

        numberingArray = [
            HwpNumbering(formatArray: [
                            HwpNumberingFormat(property: [12, 0, 0, 0, 0, 0, 50, 0, 255, 255, 255, 255], formatLength: 3, format: "^1."),
                            HwpNumberingFormat(property: [12, 1, 0, 0, 0, 0, 50, 0, 255, 255, 255, 255], formatLength: 3, format: "^2."),
                            HwpNumberingFormat(property: [12, 0, 0, 0, 0, 0, 50, 0, 255, 255, 255, 255], formatLength: 3, format: "^3)"),
                            HwpNumberingFormat(property: [12, 1, 0, 0, 0, 0, 50, 0, 255, 255, 255, 255], formatLength: 3, format: "^4)"),
                            HwpNumberingFormat(property: [12, 0, 0, 0, 0, 0, 50, 0, 255, 255, 255, 255], formatLength: 4, format: "(^5)"),
                            HwpNumberingFormat(property: [12, 1, 0, 0, 0, 0, 50, 0, 255, 255, 255, 255], formatLength: 4, format: "(^6)"),
                            HwpNumberingFormat(property: [44, 0, 0, 0, 0, 0, 50, 0, 255, 255, 255, 255], formatLength: 2, format: "^7")],
                         startingIndex: 0,
                         startingIndexArray: [1, 1, 1, 1, 1, 1, 1],
                         extendedFormatArray: [
                            HwpNumberingFormat(property: [8, 0, 0, 0, 0, 0, 50, 0, 255, 255, 255, 255], formatLength: 0, format: ""),
                            HwpNumberingFormat(property: [8, 0, 0, 0, 0, 0, 50, 0, 255, 255, 255, 255], formatLength: 0, format: ""),
                            HwpNumberingFormat(property: [8, 0, 0, 0, 0, 0, 50, 0, 255, 255, 255, 255], formatLength: 0, format: "")
                         ],
                         extendedStartingIndexArray: [1, 1, 1]
            )
        ]

        bulletArray = [HwpBullet]()

        paraShapeArray = [
            HwpParaShape(property1: 384, marginLeft: 0, tabDefId: 0),
            HwpParaShape(property1: 384, marginLeft: 3000, tabDefId: 0),
            HwpParaShape(property1: 8399232, marginLeft: 2000, tabDefId: 1),
            HwpParaShape(property1: 41953664, marginLeft: 4000, tabDefId: 1),
            HwpParaShape(property1: 75508096, marginLeft: 6000, tabDefId: 1),
            HwpParaShape(property1: 109062528, marginLeft: 8000, tabDefId: 1),
            HwpParaShape(property1: 142616960, marginLeft: 10000, tabDefId: 1),
            HwpParaShape(property1: 176171392, marginLeft: 12000, tabDefId: 1),
            HwpParaShape(property1: 209725824, marginLeft: 14000, tabDefId: 1),
            HwpParaShape(property1: 256, marginLeft: 0, lineSpacing: 150, tabDefId: 0, lineSpacing2: Optional(150)),
            HwpParaShape(property1: 384, marginLeft: 0, indent: -2620, lineSpacing: 130, tabDefId: 0, lineSpacing2: Optional(130)),
            HwpParaShape(property1: 260, marginLeft: 0, lineSpacing: 130, tabDefId: 0, lineSpacing2: Optional(130)),
            HwpParaShape(property1: 10500, marginLeft: 0, paragraphSpacingTop: 2400, paragraphSpacingBottom: 600, tabDefId: 1),
            HwpParaShape(property1: 260, marginLeft: 0, paragraphSpacingBottom: 1400, tabDefId: 2),
            HwpParaShape(property1: 260, marginLeft: 2200, paragraphSpacingBottom: 1400, tabDefId: 2),
            HwpParaShape(property1: 260, marginLeft: 4400, paragraphSpacingBottom: 1400, tabDefId: 2),
            HwpParaShape(property1: 209715584, marginLeft: 18000, tabDefId: 1),
            HwpParaShape(property1: 209715584, marginLeft: 20000, tabDefId: 1),
            HwpParaShape(property1: 209715584, marginLeft: 16000, tabDefId: 1)
        ]

        styleArray = [
            HwpStyle("바탕글", "Normal", nextId: 0, paraShapeId: 0, charShapeId: 0),
            HwpStyle("본문", "Body", nextId: 1, paraShapeId: 1, charShapeId: 0),
            HwpStyle("개요 1", "Outline 1", nextId: 2, paraShapeId: 2, charShapeId: 0),
            HwpStyle("개요 2", "Outline 2", nextId: 3, paraShapeId: 3, charShapeId: 0),
            HwpStyle("개요 3", "Outline 3", nextId: 4, paraShapeId: 4, charShapeId: 0),
            HwpStyle("개요 4", "Outline 4", nextId: 5, paraShapeId: 5, charShapeId: 0),
            HwpStyle("개요 5", "Outline 5", nextId: 6, paraShapeId: 6, charShapeId: 0),
            HwpStyle("개요 6", "Outline 6", nextId: 7, paraShapeId: 7, charShapeId: 0),
            HwpStyle("개요 7", "Outline 7", nextId: 8, paraShapeId: 8, charShapeId: 0),
            HwpStyle("개요 8", "Outline 8", nextId: 9, paraShapeId: 18, charShapeId: 0),
            HwpStyle("개요 9", "Outline 9", nextId: 10, paraShapeId: 16, charShapeId: 0),
            HwpStyle("개요 10", "Outline 10", nextId: 11, paraShapeId: 17, charShapeId: 0),
            HwpStyle("쪽 번호", "Page Number", property: 1, nextId: 0, paraShapeId: 0, charShapeId: 1),
            HwpStyle("머리말", "Header", nextId: 13, paraShapeId: 9, charShapeId: 2),
            HwpStyle("각주", "Footnote", nextId: 14, paraShapeId: 10, charShapeId: 3),
            HwpStyle("미주", "Endnote", nextId: 15, paraShapeId: 10, charShapeId: 3),
            HwpStyle("메모", "Memo", nextId: 16, paraShapeId: 11, charShapeId: 4),
            HwpStyle("차례 제목", "TOC Heading", nextId: 17, paraShapeId: 12, charShapeId: 5),
            HwpStyle("차례 1", "TOC 1", nextId: 18, paraShapeId: 13, charShapeId: 6),
            HwpStyle("차례 2", "TOC 2", nextId: 19, paraShapeId: 14, charShapeId: 6),
            HwpStyle("차례 3", "TOC 3", nextId: 20, paraShapeId: 15, charShapeId: 6)
        ]

        forbiddenCharArray  = [HwpForbiddenChar(data: Data(repeating: 0, count: 16))]
        // swiftlint:enable line_length
    }

    init(_ record: HwpRecord, _ version: HwpVersion) throws {
        var reader = DataReader(record.payload)
        defer {
            // precondition(reader.isEOF())
        }
        binaryDataCount = reader.read(Int32.self)
        faceNameKoreanCount = reader.read(Int32.self)
        faceNameEnglishCount = reader.read(Int32.self)
        faceNameChineseCount = reader.read(Int32.self)
        faceNameJapaneseCount = reader.read(Int32.self)
        faceNameEtcCount = reader.read(Int32.self)
        faceNameSymbolCount = reader.read(Int32.self)
        faceNameUserCount = reader.read(Int32.self)
        borderFillCount = reader.read(Int32.self)
        charShapeCount = reader.read(Int32.self)
        tabDefCount = reader.read(Int32.self)
        numberingCount = reader.read(Int32.self)
        bulletCount = reader.read(Int32.self)
        paraShapeCount = reader.read(Int32.self)
        styleCount = reader.read(Int32.self)
        if version >= HwpVersion(5, 0, 2, 1) {
            memoShapeCount = reader.read(Int32.self)
        }
        if version >= HwpVersion(5, 0, 3, 2) {
            changeTraceCount = reader.read(Int32.self)
            changeTraceUserCount = reader.read(Int32.self)
        }

        binDataArray = try record.children.pop(binaryDataCount)
            .map {try HwpBinData.load($0.payload)}
        faceNameKoreanArray = try record.children.pop(faceNameKoreanCount)
            .map {try HwpFaceName.load($0.payload)}
        faceNameEnglishArray = try record.children.pop(faceNameEnglishCount)
            .map {try HwpFaceName.load($0.payload)}
        faceNameChineseArray = try record.children.pop(faceNameChineseCount)
            .map {try HwpFaceName.load($0.payload)}
        faceNameJapaneseArray = try record.children.pop(faceNameJapaneseCount)
            .map {try HwpFaceName.load($0.payload)}
        faceNameEtcArray = try record.children.pop(faceNameEtcCount)
            .map {try HwpFaceName.load($0.payload)}
        faceNameSymbolArray = try record.children.pop(faceNameSymbolCount)
            .map {try HwpFaceName.load($0.payload)}
        faceNameUserArray = try record.children.pop(faceNameUserCount)
            .map {try HwpFaceName.load($0.payload)}

        borderFillArray = try record.children.pop(borderFillCount)
            .map {try HwpBorderFill.load($0.payload)}
        charShapeArray = try record.children.pop(charShapeCount)
            .map {try HwpCharShape($0.payload, version)}
        tabDefArray = try record.children.pop(tabDefCount)
            .map {try HwpTabDef.load($0.payload)}
        numberingArray = try record.children.pop(numberingCount)
            .map {try HwpNumbering($0.payload, version)}
        bulletArray = try record.children.pop(bulletCount)
            .map {try HwpBullet.load($0.payload)}
        paraShapeArray = try record.children.pop(paraShapeCount)
            .map {try HwpParaShape($0.payload, version)}
        styleArray = try record.children.pop(styleCount)
            .map {try HwpStyle.load($0.payload)}

        forbiddenCharArray = [HwpForbiddenChar]()

        if record.children.isEmpty {
            return
        }
        for child in record.children {
            switch child.tagId {
            case HwpDocInfoTag.forbiddenChar.rawValue:
                forbiddenCharArray.append(try HwpForbiddenChar.load(child.payload))
            default:
                print("HKFWarning : Unidentified Tag \(child.tagId)")
            }
        }
    }
}
