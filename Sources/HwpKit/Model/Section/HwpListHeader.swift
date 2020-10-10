import Foundation

/**
 문단 리스트 헤더
 
 Tag ID : HWPTAG_LIST_HEADER
 */
public struct HwpListHeader: HwpFromData {
    /**
     문단 수
     
     한글문서에선 Int16으로 되어있으나 대부분의 경우 Int32 으로 읽어야 문제가 없다
     */
    public let paragraphCount: Int32
    public let property: UInt32

    init() {
        paragraphCount = 0
        property = 0
    }

    init(_ data: Data) throws {
        var reader = DataReader(data)
        defer {
            precondition(reader.isEOF())
        }

        paragraphCount = reader.read(Int32.self)
        property = reader.read(UInt32.self)
    }
}
