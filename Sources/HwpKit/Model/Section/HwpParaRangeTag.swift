import Foundation

/**
 문단의 영역 태그
 
 range tag 정보를 정보 수만큼 읽어 온다. range tag는 텍스트의 일정 영역을 마킹하는 용도로 사용되 며, 글자 모양과는 달리 각 영역은 서로 겹칠 수 있다.(형광펜, 교정 부호 등)
 Tag ID : HWPTAG_PARA_RANGE_TAG
 */
public struct HwpParaRangeTag: HwpData {
    /**영역 시작*/
    public let start: UInt32
    /**영역 끝*/
    public let end: UInt32
    /**
     태그(종류 + 데이터)
     
     상위 8비트가 종류를 하위 24비트가 종류별로 다른 설명을 부여할 수 있는 임의의 데이터를 나타낸다.
     */
    public let tag: UInt32

    init(_ data: Data) throws {
        var reader = DataReader(data)
        defer {
            precondition(reader.isEOF())
        }

        start = reader.read(UInt32.self)
        end = reader.read(UInt32.self)
        tag = reader.read(UInt32.self)
    }
}
