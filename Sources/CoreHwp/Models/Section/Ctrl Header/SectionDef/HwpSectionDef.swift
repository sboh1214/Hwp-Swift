import Foundation

/** 구역 정의 */
public struct HwpSectionDef {
    public var pageDef: HwpPageDef
    /** 각주 모양 정보 */
    public var footNoteShape: HwpFootnoteShape
    /** 미주 모양 정보 */
    public var endNoteShape: HwpFootnoteShape
    /** 양쪽 테두리/배경 정보 */
    public var pageBorderFillBoth: HwpPageBorderFill
    /** 짝수쪽 테두리/배경 정보 */
    public var pageBorderFillEven: HwpPageBorderFill
    /** 홀수쪽 테두리/배경 정보 */
    public var pageBorderFillOdd: HwpPageBorderFill

    /** 속성 */
    public var property: UInt32
    /** 동일한 페이지에서 서로 다른 단 사이의 간격 */
    public var columnSpacing: HWPUNIT16
    /**
     세로로 줄맞춤을 할지 여부

     0 = off, 1 - n = 간격을 HWPUNIT 단위로 지정
     */
    public var verticalLineAlign: HWPUNIT16
    /**
     가로로 줄맞춤을 할지 여부

     0 = off, 1 - n = 간격을 HWPUNIT 단위로 지정
     */
    public var horizontalLineAlign: HWPUNIT16
    /**
     기본 탭 간격

     hwpunit 또는 relative characters
     */
    public var defaultTabSpacing: HWPUNIT
    /** 번호 문단 모양 ID */
    public var numberParaShapeId: UInt16
    /**
     쪽 번호

     (0 = 앞 구역에 이어, n = 임의의 번호로 시작)
     */
    public var pageStartNumber: UInt16
    /**
     그림 번호

     (0 = 앞 구역에 이어, n = 임의의 번호로 시작)
     */
    public var pictureStartNumber: UInt16
    /**
     표 번호

     (0 = 앞 구역에 이어, n = 임의의 번호로 시작)
     */
    public var tableStartNumber: UInt16
    /**
     수식 번호

     (0 = 앞 구역에 이어, n = 임의의 번호로 시작)
     */
    public var equationNumber: UInt16
    /**
     대표Language

     (Language값이 없으면(==0), Application에 지정된 Language)
     5.0.1.5 이상
     */
    public var defaultLanguage: UInt16?
    /** unknown 12, 21bytes */
    public var unknown: Data
}

extension HwpSectionDef: HwpFromRecordWithVersion {
    init(_ reader: inout DataReader, _ children: [HwpRecord], _ version: HwpVersion) throws {
        pageDef = try HwpPageDef.load(children[0].payload)
        footNoteShape = try HwpFootnoteShape.load(children[1].payload)
        endNoteShape = try HwpFootnoteShape.load(children[2].payload)
        pageBorderFillBoth = try HwpPageBorderFill.load(children[3].payload)
        pageBorderFillEven = try HwpPageBorderFill.load(children[4].payload)
        pageBorderFillOdd = try HwpPageBorderFill.load(children[5].payload)

        property = reader.read(UInt32.self)
        columnSpacing = reader.read(HWPUNIT16.self)
        verticalLineAlign = reader.read(HWPUNIT16.self)
        horizontalLineAlign = reader.read(HWPUNIT16.self)
        defaultTabSpacing = reader.read(HWPUNIT.self)
        numberParaShapeId = reader.read(UInt16.self)
        pageStartNumber = reader.read(UInt16.self)
        pictureStartNumber = reader.read(UInt16.self)
        tableStartNumber = reader.read(UInt16.self)
        equationNumber = reader.read(UInt16.self)
        if version >= HwpVersion(5, 0, 1, 5) {
            defaultLanguage = reader.read(UInt16.self)
        }
        unknown = reader.readToEnd()
    }
}

extension HwpSectionDef {
    init() {
        pageDef = HwpPageDef()
        footNoteShape = HwpFootnoteShape(
            dividerLength: -1, dividerMarginTop: -1, dividerType: 27, dividerThickness: 1
        )
        endNoteShape = HwpFootnoteShape(
            dividerLength: 12280, dividerMarginTop: 224, dividerType: 0, dividerThickness: 0
        )
        pageBorderFillBoth = HwpPageBorderFill(property: 158_923_201)
        pageBorderFillEven = HwpPageBorderFill(property: 656_083_841)
        pageBorderFillOdd = HwpPageBorderFill(property: 1)

        property = 1_936_024_420
        columnSpacing = 0
        verticalLineAlign = 0
        horizontalLineAlign = 1134
        defaultTabSpacing = 0
        numberParaShapeId = 8000
        pageStartNumber = 0
        pictureStartNumber = 1
        tableStartNumber = 0
        equationNumber = 0

        defaultLanguage = 0
        unknown = Data(Array(repeating: 0, count: 21))
    }
}
