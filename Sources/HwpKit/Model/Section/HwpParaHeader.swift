import Foundation

/**
 문단 헤더
 
 Tag ID : HWPTAG_PARA_HEADER
 텍스트의 수가 1 이상이면 문자 수만큼 텍스트를 로드하고 그렇지 않을 경우 PARA_BREAK로 문단을 생성한다.
 */
public struct HwpParaHeader: HwpDataWithVersion {
    /**if (nchars & 0x80000000) { nchars &= 0x7fffffff;}*/
    public let isLastInList: Bool
    /**text(=chars)*/
    public let charCount: UInt32
    /**
     control mask
     
     (UINT32)(1<<ctrlch) 조합
     ctrlch는 HwpCtrlAPI.Hwp 2.1 CtrlCh 참고
     */
    public let controlMask: UInt32
    /**문단 모양 아이디 참조값*/
    public let paraShapeId: UInt16
    /**문단 스타일 아이디 참조값*/
    public let paraStyleId: UInt8
    /**단 나누기 종류*/
    public let columnType: UInt8
    /**글자 모양 정보 수*/
    public let charShapeInfoCount: UInt16
    /**range tag 정보 수*/
    public let rangeTagInfoCount: UInt16
    /**각 줄에 대한 align에 대한 정보 수*/
    public let alignInfoCount: UInt16
    /**문단 Instance ID (unique ID)*/
    public let paraId: UInt32
    /**변경추적 병합 문단여부. (5.0.3.2 버전 이상)*/
    public var isTraceChange: UInt16?

    init(_ data: Data, _ version: HwpVersion) throws {
        var reader = DataReader(data)
        let value = reader.read(UInt32.self)
        if (value & 0x80000000) == 0x80000000 {
            isLastInList = true
            charCount = (value & 0x7fffffff)
        } else {
            isLastInList = false
            charCount = value
        }
        controlMask = reader.read(UInt32.self)
        paraShapeId = reader.read(UInt16.self)
        paraStyleId = reader.read(UInt8.self)
        columnType = reader.read(UInt8.self)
        charShapeInfoCount = reader.read(UInt16.self)
        rangeTagInfoCount = reader.read(UInt16.self)
        alignInfoCount = reader.read(UInt16.self)
        paraId = reader.read(UInt32.self)
        if version >= HwpVersion(5, 0, 3, 2) {
            isTraceChange = reader.read(UInt16.self)
        }
    }
}
