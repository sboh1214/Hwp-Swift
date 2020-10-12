import Foundation

public struct HwpCharShape: HwpFromDataWithVersion {
    /**언어별 글꼴 ID(FaceID) 참조 값*/
    public let faceId: [WORD]
    /**언어별 장평, 50%~200%(*/
    public let faceScaleX: [UInt8]
    /**언어별 자간, -50%~50%*/
    public let faceSpacing: [Int8]
    /**언어별 상대 크기, 10%~250%*/
    public let faceRelativeSize: [UInt8]
    /**언어별 글자 위치, -100%~100%*/
    public let faceLocation: [Int8]
    /**기준 크기, 0pt~4096pt*/
    public let baseSize: Int32
    /**속성*/
    public let property: UInt32
    /**그림자 간격, -100%~100%*/
    public let shadowInterval: Int8
    /**그림자 간격, -100%~100%*/
    public let shadowInterval2: Int8
    /**글자 색*/
    public let faceColor: HwpColor
    /**밑줄 색*/
    public let underlineColor: HwpColor
    /**음영 색*/
    public let shadeColor: HwpColor
    /**그림자 색*/
    public let shadowColor: HwpColor
    /**글자 테두리/배경 ID(CharShapeBorderFill ID) 참조 값 (5.0.2.1 이상)*/
    public var borderFillId: UInt16?
    /**취소선 색 (5.0.3.0 이상)*/
    public var strikethroughColor: HwpColor?

    init() {
        faceId = [0]
        faceScaleX = [0]
        faceSpacing = [0]
        faceRelativeSize = [0]
        faceLocation = [0]
        baseSize = 0
        property = 0
        shadowInterval = 0
        shadowInterval2 = 0
        faceColor = HwpColor()
        underlineColor = HwpColor()
        shadeColor = HwpColor()
        shadowColor = HwpColor()
        borderFillId = nil
        strikethroughColor = nil
    }

    init(_ data: Data, _ version: HwpVersion) throws {
        var reader = DataReader(data)
        defer {
            precondition(reader.isEOF())
        }
        faceId = reader.read(WORD.self, 7)
        faceScaleX = reader.readBytes(7).bytes
        faceSpacing = reader.read(Int8.self, 7)
        faceRelativeSize = reader.readBytes(7).bytes
        faceLocation = reader.read(Int8.self, 7)
        baseSize = reader.read(Int32.self)
        property = reader.read(UInt32.self)
        shadowInterval = reader.read(Int8.self)
        shadowInterval2 = reader.read(Int8.self)
        faceColor = HwpColor(reader.read(UInt32.self))
        underlineColor = HwpColor(reader.read(UInt32.self))
        shadeColor = HwpColor(reader.read(UInt32.self))
        shadowColor = HwpColor(reader.read(UInt32.self))
        if version >= HwpVersion(5, 0, 2, 1) {
            borderFillId = reader.read(UInt16.self)
        }
        if version >= HwpVersion(5, 0, 3, 0) {
            strikethroughColor = HwpColor(reader.read(UInt32.self))
        }
    }
}
