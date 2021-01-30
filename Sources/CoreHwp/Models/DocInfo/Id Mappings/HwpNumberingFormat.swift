import Foundation

public struct HwpNumberingFormat: HwpPrimitive {
    /**
     속성

     * 주의! : 잘못된 문서화
     길이: 12바이트
     */
    public let property: [BYTE]
    /** 번호 형식 길이 */
    public let formatLength: WORD
    /**
     번호 형식.

     불릿 문단의 경우에는 사용되지 않는다. 문자열 내 특정 문자에 제어코드(^)를 붙임으로써 한글에서 표시되는 번호 문단 머리의 형식을 제어한다.
     ^n : 레벨 경로를 표시한다.(예: 1.1.1.1.1.1.1)
     ^N : 레벨 경로를 표시하며 마지막에 마침표를 하나 더 찍는다.(예: 1.1.1.1.1.1.1.)
     */
    public let format: String
}

extension HwpNumberingFormat {
    init(_ bytes: [BYTE], _ formatLength: WORD, _ format: String) {
        property = bytes
        self.formatLength = formatLength
        self.format = format
    }
}
