import Foundation

/**
 문단의 텍스트
 
 Tag ID : HWPTAG_PARA_TEXT
 문단은 최소 하나의 문자 Shape buffer가 존재하며, 첫 번째 pos가 반드시 0이어야 한다.
 텍스트 문자 Shape 레코드를 글자 모양 정보 수(Character Shapes)만큼 읽는다.
 */
public struct HwpParaText: HwpData {
    /**문자수만큼의 텍스트*/
    public var charArray: [HwpChar]
    
    init(_ data: Data) throws {
        var reader = DataReader(data)
        var array = [HwpChar]()
        while !reader.isEOF() {
            let char = reader.read(WCHAR.self)
            switch char {
            case 0,1,13:
                array.append(HwpChar(type: .char, value: char))
            case 4...9, 19...20:
                array.append(HwpChar(type: .inline, value: char))
                reader.readBytes(14)
            case 1...3, 11...12, 14...18, 21...23:
                array.append(HwpChar(type: .extended, value: char))
                reader.readBytes(14)
            default:
                array.append(HwpChar(type: .char, value: char))
            }
        }
        charArray = array
    }
}
