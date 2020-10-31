import Foundation

/**
 탭 정보 (count 개수)
 */
public struct HwpTabInfo {
    /**탭의 위치*/
    public let location: HWPUNIT
    /**
     탭의 종류
     
     값 설명
     0 왼쪽
     1 오른쪽
     2 가운데
     3 소수점
     */
    public let type: UInt8
    /**채움 종류*/
    public let fillType: UInt8
    /**8 바이트를 맞추기 위한 예약*/
    public let reserved: UInt16
}

extension HwpTabInfo: HwpFromData {
    init(_ data: Data) throws {
        var reader = DataReader(data)

        location = reader.read(HWPUNIT.self)
        type = reader.read(UInt8.self)
        fillType = reader.read(UInt8.self)
        reserved = reader.read(UInt16.self)

        if !reader.isEOF {
                    throw HwpError.dataIsNotEOF(remain: reader.remainBytes)
                }
    }
}
