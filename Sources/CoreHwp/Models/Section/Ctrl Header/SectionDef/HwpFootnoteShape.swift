import Foundation

/**
 4.3.10.1.2. 각주/미주 모양
 
 Tag ID : HWPTAG_FOOTNOTE_SHAPE
 */
public struct HwpFootnoteShape {
    /**속성*/
    public var property: UInt32
    /**사용자 기호*/
    public var userSymbol: Character
    /**앞 장식 문자*/
    public var decorationHead: Character
    /**뒤 장식 문자*/
    public var decorationTail: Character
    /**시작 번호*/
    public var startingNumber: UInt16
    /**구분선 길이*/
    public var dividerLength: HWPUNIT16
    /**구분선 위 여백*/
    public var dividerMarginTop: HWPUNIT16
    /**구분선 아래 여백*/
    public var dividerMarginBottom: HWPUNIT16
    /**주석 사이 여백*/
    public var marginComment: HWPUNIT16
    /**
     구분선 종류
     
     (테두리/배경의 테두리 선 종류 참조)
     */
    public var dividerType: UInt8
    /**
     구분선 굵기
     
     (테두리/배경의 테두리 선 굵기 참조)
     */
    public var dividerThickness: UInt8
    /**
     구분선 색상
     
     (테두리/배경의 테두리 선 색상 참조)
     */
    public var dividerColor: HwpColor
    /**unknown 2bytes*/
    public var unknown: Data
}

extension HwpFootnoteShape: HwpFromData {
    init(_ reader: inout DataReader) throws {
        property = reader.read(UInt32.self)
        userSymbol = reader.read(WCHAR.self).character
        decorationHead = reader.read(WCHAR.self).character
        decorationTail = reader.read(WCHAR.self).character
        startingNumber = reader.read(UInt16.self)
        dividerLength = reader.read(HWPUNIT16.self)
        dividerMarginTop = reader.read(HWPUNIT16.self)
        dividerMarginBottom = reader.read(HWPUNIT16.self)
        marginComment = reader.read(HWPUNIT16.self)
        dividerType = reader.read(UInt8.self)
        dividerThickness = reader.read(UInt8.self)
        dividerColor = HwpColor(reader.read(COLORREF.self))
        unknown = reader.readBytes(2)
    }
}

extension HwpFootnoteShape {
    init(dividerLength: HWPUNIT16, dividerMarginTop: HWPUNIT16,
         dividerType: UInt8, dividerThickness: UInt8) {
        property = 0
        userSymbol = "\0"
        decorationHead = "\0"
        decorationTail = ")"
        startingNumber = 1
        self.dividerLength = dividerLength
        self.dividerMarginTop = dividerMarginTop
        dividerMarginBottom = 850
        marginComment = 567
        self.dividerType = dividerType
        self.dividerThickness = dividerThickness
        dividerColor = HwpColor(red: 1, green: 1, blue: 1)
        unknown = Data(Array(repeating: 0, count: 2))
    }
}
