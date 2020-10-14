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
    public var styleArray: [HwpStyle]
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
            HwpParaShape(property1: 384, marginLeft: 0, paragraphSpacingBottom: 0, tabDefId: 0),
            HwpParaShape(property1: 384, marginLeft: 3000, paragraphSpacingBottom: 0, tabDefId: 0),
            HwpParaShape(property1: 8399232, marginLeft: 2000, paragraphSpacingBottom: 0, tabDefId: 1),
            HwpParaShape(property1: 41953664, marginLeft: 4000, paragraphSpacingBottom: 0, tabDefId: 1),
            HwpParaShape(property1: 75508096, marginLeft: 6000, paragraphSpacingBottom: 0, tabDefId: 1),
            HwpParaShape(property1: 109062528, marginLeft: 8000, paragraphSpacingBottom: 0, tabDefId: 1),
            HwpParaShape(property1: 142616960, marginLeft: 10000, paragraphSpacingBottom: 0, tabDefId: 1),
            HwpParaShape(property1: 176171392, marginLeft: 12000, paragraphSpacingBottom: 0, tabDefId: 1),
            HwpParaShape(property1: 209725824, marginLeft: 14000, paragraphSpacingBottom: 0, tabDefId: 1),
            HwpParaShape(property1: 256, marginLeft: 0, paragraphSpacingBottom: 0, lineSpacing: 150, tabDefId: 0, lineSpacing2: Optional(150)),
            HwpParaShape(property1: 384, marginLeft: 0, indent: -2620, paragraphSpacingBottom: 0, lineSpacing: 130, tabDefId: 0, lineSpacing2: Optional(130)),
            HwpParaShape(property1: 260, marginLeft: 0, paragraphSpacingBottom: 0, lineSpacing: 130, tabDefId: 0, lineSpacing2: Optional(130)),
            HwpParaShape(property1: 10500, marginLeft: 0, paragraphSpacingTop: 2400, paragraphSpacingBottom: 600, tabDefId: 1),
            HwpParaShape(property1: 260, marginLeft: 0, paragraphSpacingBottom: 1400, tabDefId: 2),
            HwpParaShape(property1: 260, marginLeft: 2200, paragraphSpacingBottom: 1400, tabDefId: 2),
            HwpParaShape(property1: 260, marginLeft: 4400, paragraphSpacingBottom: 1400, tabDefId: 2),
            HwpParaShape(property1: 209715584, marginLeft: 18000, paragraphSpacingBottom: 0, tabDefId: 1),
            HwpParaShape(property1: 209715584, marginLeft: 20000, paragraphSpacingBottom: 0, tabDefId: 1),
            HwpParaShape(property1: 209715584, marginLeft: 16000, paragraphSpacingBottom: 0, tabDefId: 1)
        ]

        styleArray = [
            HwpStyle(styleLocalName: "바탕글", styelEnglishName: "Normal", property: 0, nextId: 0, paraShapeId: 0, charShapeId: 0),
            HwpStyle(styleLocalName: "본문", styelEnglishName: "Body", property: 0, nextId: 1, paraShapeId: 1, charShapeId: 0),
            HwpStyle(styleLocalName: "개요 1", styelEnglishName: "Outline 1", property: 0, nextId: 2, paraShapeId: 2, charShapeId: 0),
            HwpStyle(styleLocalName: "개요 2", styelEnglishName: "Outline 2", property: 0, nextId: 3, paraShapeId: 3, charShapeId: 0),
            HwpStyle(styleLocalName: "개요 3", styelEnglishName: "Outline 3", property: 0, nextId: 4, paraShapeId: 4, charShapeId: 0),
            HwpStyle(styleLocalName: "개요 4", styelEnglishName: "Outline 4", property: 0, nextId: 5, paraShapeId: 5, charShapeId: 0),
            HwpStyle(styleLocalName: "개요 5", styelEnglishName: "Outline 5", property: 0, nextId: 6, paraShapeId: 6, charShapeId: 0),
            HwpStyle(styleLocalName: "개요 6", styelEnglishName: "Outline 6", property: 0, nextId: 7, paraShapeId: 7, charShapeId: 0),
            HwpStyle(styleLocalName: "개요 7", styelEnglishName: "Outline 7", property: 0, nextId: 8, paraShapeId: 8, charShapeId: 0),
            HwpStyle(styleLocalName: "개요 8", styelEnglishName: "Outline 8", property: 0, nextId: 9, paraShapeId: 18, charShapeId: 0),
            HwpStyle(styleLocalName: "개요 9", styelEnglishName: "Outline 9", property: 0, nextId: 10, paraShapeId: 16, charShapeId: 0),
            HwpStyle(styleLocalName: "개요 10", styelEnglishName: "Outline 10", property: 0, nextId: 11, paraShapeId: 17, charShapeId: 0),
            HwpStyle(styleLocalName: "쪽 번호", styelEnglishName: "Page Number", property: 1, nextId: 0, paraShapeId: 0, charShapeId: 1),
            HwpStyle(styleLocalName: "머리말", styelEnglishName: "Header", property: 0, nextId: 13, paraShapeId: 9, charShapeId: 2),
            HwpStyle(styleLocalName: "각주", styelEnglishName: "Footnote", property: 0, nextId: 14, paraShapeId: 10, charShapeId: 3),
            HwpStyle(styleLocalName: "미주", styelEnglishName: "Endnote", property: 0, nextId: 15, paraShapeId: 10, charShapeId: 3),
            HwpStyle(styleLocalName: "메모", styelEnglishName: "Memo", property: 0, nextId: 16, paraShapeId: 11, charShapeId: 4),
            HwpStyle(styleLocalName: "차례 제목", styelEnglishName: "TOC Heading", property: 0, nextId: 17, paraShapeId: 12, charShapeId: 5),
            HwpStyle(styleLocalName: "차례 1", styelEnglishName: "TOC 1", property: 0, nextId: 18, paraShapeId: 13, charShapeId: 6),
            HwpStyle(styleLocalName: "차례 2", styelEnglishName: "TOC 2", property: 0, nextId: 19, paraShapeId: 14, charShapeId: 6),
            HwpStyle(styleLocalName: "차례 3", styelEnglishName: "TOC 3", property: 0, nextId: 20, paraShapeId: 15, charShapeId: 6)
        ]
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

        binDataArray = [HwpBinData]()
        faceNameArray = [HwpFaceName]()
        borderFillArray = [HwpBorderFill]()
        charShapeArray = [HwpCharShape]()
        tabDefArray = [HwpTabDef]()
        numberingArray = [HwpNumbering]()
        bulletArray = [HwpBullet]()
        paraShapeArray = [HwpParaShape]()
        styleArray = [HwpStyle]()

        for child in record.children {
            switch child.tagId {
            case HwpDocInfoTag.binData:
                binDataArray.append(try HwpBinData(child.payload))
            case HwpDocInfoTag.faceName:
                faceNameArray.append(try HwpFaceName(child.payload))
            case HwpDocInfoTag.borderFill:
                borderFillArray.append(try HwpBorderFill(child.payload))
            case HwpDocInfoTag.charShape:
                charShapeArray.append(try HwpCharShape(child.payload, version))
            case HwpDocInfoTag.tabDef:
                tabDefArray.append(try HwpTabDef(child.payload))
            case HwpDocInfoTag.numbering:
                numberingArray.append(try HwpNumbering(child.payload, version))
            case HwpDocInfoTag.bullet:
                bulletArray.append(try HwpBullet(child.payload))
            case HwpDocInfoTag.paraShape:
                paraShapeArray.append(try HwpParaShape(child.payload, version))
            case HwpDocInfoTag.style:
                styleArray.append(try HwpStyle(child.payload))
            default:
                print(child.tagId)
            }
        }
    }
}
