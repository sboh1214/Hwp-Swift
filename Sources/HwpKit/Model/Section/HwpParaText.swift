import Foundation

public struct HwpParaText: HwpData {
    var charArray: [HwpChar]
    
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
