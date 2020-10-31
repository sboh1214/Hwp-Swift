import Foundation

/**
 문서 내 캐럿의 위치 정보
 */
public struct HwpCaratLocation: HwpFromData {
    /**리스트 아이디*/
    public var listId: UInt32
    /**문단 아이디*/
    public var paragraphId: UInt32
    /**문단 내에서의 글자 단위 위치*/
    public var charIndex: UInt32

    init() {
        listId = 0
        paragraphId = 0
        charIndex = 16
    }

    init(_ data: Data) throws {
        var reader = DataReader(data)

        listId = reader.read(UInt32.self)
        paragraphId = reader.read(UInt32.self)
        charIndex = reader.read(UInt32.self)

        if !reader.isEOF {
            throw HwpError.dataIsNotEOF(remain: reader.remainBytes)
        }
    }
}
