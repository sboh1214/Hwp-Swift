import Foundation

/**
 스타일(문단 스타일)

 Tag ID : HWPTAG_STYLE

 TODO: 끝에 문서화되지 않은 2바이트가 붙어 있음
 */
public struct HwpStyle {
    /** 길이 (len1) */
    public let length1: WORD
    /** 로컬 스타일 이름. 한글 윈도우에서는 한글 스타일 이름 */
    public let styleLocalName: String
    /** 길이 (len2) */
    public let length2: WORD
    /** 영문 스타일 이름 */
    public let styelEnglishName: String
    /** 속성 */
    public let property: BYTE
    /** 다음 스타일 아이디 참조값 */
    public let nextId: BYTE
    /** 언어 아이디 */
    public let languageId: Int16
    /**
     문단 모양 아이디 참조값(문단 모양의 아이디 속성)

     스타일의 종류가 문단인 경우 반드시 지정해야 한다.
     */
    public let paraShapeId: UInt16
    /**
     글자 모양 아이디(글자 모양의 아이디 속성)

     스타일의 종류가 글자인 경우 반드시 지정해야 한다.
     */
    public let charShapeId: UInt16
    /** 문서화되어있지 않음 */
    public let unknown: [BYTE]
}

extension HwpStyle: HwpFromData {
    init(_ reader: inout DataReader) throws {
        length1 = reader.read(WORD.self)
        styleLocalName = reader.read(WCHAR.self, Int(length1)).string
        length2 = reader.read(WORD.self)
        styelEnglishName = reader.read(WCHAR.self, Int(length2)).string
        property = reader.read(BYTE.self)
        nextId = reader.read(BYTE.self)
        languageId = reader.read(Int16.self)
        paraShapeId = reader.read(UInt16.self)
        charShapeId = reader.read(UInt16.self)
        unknown = reader.readBytes(2).bytes
    }
}

extension HwpStyle {
    init(_ styleLocalName: String, _ styelEnglishName: String, property: BYTE = 0,
         nextId: BYTE, paraShapeId: UInt16, charShapeId: UInt16)
    {
        length1 = WORD(styleLocalName.count)
        self.styleLocalName = styleLocalName
        length2 = WORD(styelEnglishName.count)
        self.styelEnglishName = styelEnglishName
        self.property = property
        self.nextId = nextId
        languageId = 1042
        self.paraShapeId = paraShapeId
        self.charShapeId = charShapeId
        unknown = [0, 0]
    }
}
