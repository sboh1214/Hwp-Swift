import Foundation

/**
 글자 모양
 
 Tag ID : HWPTAG_CHAR_SHAPE
 */
public struct HwpCharShape {
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
}

extension HwpCharShape: HwpFromDataWithVersion {
    init(_ reader: inout DataReader, _ version: HwpVersion) throws {
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

extension HwpCharShape {
    init(faceId: [WORD], faceSpacing: [Int8], baseSize: Int32, faceColor: HwpColor) {
        self.faceId = faceId
        self.faceScaleX = [100, 100, 100, 100, 100, 100, 100]
        self.faceSpacing = faceSpacing
        self.faceRelativeSize = [100, 100, 100, 100, 100, 100, 100]
        self.faceLocation = [0, 0, 0, 0, 0, 0, 0]
        self.baseSize = baseSize
        self.property = 0
        self.shadowInterval = 10
        self.shadowInterval2 = 10
        self.faceColor = faceColor
        self.underlineColor = HwpColor()
        self.shadeColor = HwpColor(255, 255, 255)
        self.shadowColor = HwpColor(192, 192, 192)
        self.borderFillId = 2
        self.strikethroughColor = HwpColor()
    }
}
