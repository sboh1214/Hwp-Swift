import Foundation

/**
 컨트롤 헤더
 
 컨트롤 문자가 존재하면 컨트롤 문자로부터 존재하는 컨트롤 정보를 생성한다.
 Tag ID : HWPTAG_CTRL_HEADER
 */
public struct HwpCtrlHeader: HwpData {
    public let id: UInt32

    init(_ data: Data) throws {
        var reader = DataReader(data)
        id = reader.read(UInt32.self)
    }
}
