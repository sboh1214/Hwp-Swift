import Foundation

/**
 문단의 레이아웃
 
 Tag ID : HWPTAG_PARA_LINE_SEG
 문단의 각 줄을 출력할 때 사용한 Cache 정보이며, 문단 정보의 ‘각 줄에 대한 align에 대한 정보 수’만큼 반복한다.
 */
public struct HwpParaLineSeg: HwpFromData {
    public var paraLineSegInternalArray: [HwpParaLineSegInternal]

    init() {
        paraLineSegInternalArray = [HwpParaLineSegInternal()]
    }

    init(_ reader: inout DataReader) throws {
        paraLineSegInternalArray = [HwpParaLineSegInternal]()
        while !reader.isEOF {
            paraLineSegInternalArray.append(HwpParaLineSegInternal(&reader))
        }
    }
}
