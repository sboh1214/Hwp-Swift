import Foundation

/**
 문단 번호
 
 Tag ID : HWPTAG_NUMBERING
 
 * 잘못된 문서화
 */
public struct HwpNumbering {
    /**
     7회 반복 수준(1~7)
     
     각 레벨에 해당하는 숫자 또는 문자 또는 기호를 표시
     */
    public var formatArray: [HwpNumberingFormat]
    /**시작 번호*/
    public let startingIndex: UInt16
    /**수준별 시작번호 (5.0.2.5 이상)*/
    public var startingIndexArray: [UInt32]?
    /**
     3회 반복 수준(8~10)
     
     각 레벨에 해당하는 숫자 또는 문자 또는 기호를 표시
     */
    public var extendedFormatArray: [HwpNumberingFormat]?
    /**확장 수준별 시작번호 (5.1.0.0 이상)*/
    public var extendedStartingIndexArray: [UInt32]?
}

extension HwpNumbering: HwpFromDataWithVersion {
    init(_ reader: inout DataReader, _ version: HwpVersion) throws {
        formatArray = [HwpNumberingFormat]()
        for _ in 1...7 {
            let bytes = reader.readBytes(12).bytes
            let length = reader.read(WORD.self)
            let format = reader.read(WCHAR.self, length).string
            formatArray.append(HwpNumberingFormat(bytes, length, format))
        }
        startingIndex = reader.read(UInt16.self)
        if version >= HwpVersion(5, 0, 2, 5) {
            startingIndexArray = [UInt32]()
            for _ in 1...7 {
                startingIndexArray?.append(reader.read(UInt32.self))
            }
        }
        if version >= HwpVersion(5, 1, 0, 0) {
            extendedFormatArray = [HwpNumberingFormat]()
            for _ in 8...10 {
                let bytes = reader.readBytes(12).bytes
                let length = reader.read(WORD.self)
                let format = reader.read(WCHAR.self, length).string
                extendedFormatArray?.append(HwpNumberingFormat(bytes, length, format))
            }
            extendedStartingIndexArray = [UInt32]()
            for _ in 8...10 {
                extendedStartingIndexArray?.append(reader.read(UInt32.self))
            }
        }
    }
}
