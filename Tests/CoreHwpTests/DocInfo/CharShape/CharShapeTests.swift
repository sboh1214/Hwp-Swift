import CoreHwp
import Nimble
import XCTest

final class CharShapeTests: XCTestCase {
    func testCharShape() throws {
        let hwp = try openHwp(#file, "CharShape")
        let array = hwp.docInfo.idMappings.charShapeArray

        expect(array[0].faceId) == [0, 0, 0, 0, 0, 0, 0]
        expect(array[9].faceScaleX) == Array(repeating: 70, count: 7)
        expect(array[8].faceSpacing) == Array(repeating: 50, count: 7)
        expect(array[10].faceRelativeSize) == Array(repeating: 170, count: 7)
        expect(array[11].faceLocation) == Array(repeating: 30, count: 7)
        expect(array[12].shadowIntervalX) == 10
        expect(array[13].shadowIntervalY) == 10
        expect(array[14].faceColor) == HwpColor(255, 0, 0)
        expect(array[15].underlineColor) == HwpColor(0, 255, 0)
        expect(array[16].shadeColor) == HwpColor(0, 0, 255)
        expect(array[17].shadowColor) == HwpColor(255, 255, 0)
        expect(array[18].strikethroughColor) == HwpColor(0, 255, 255)
    }

    func testCharShapeProperty() throws {
        let hwp = try openHwp(#file, "CharShapeProperty")
        let array = hwp.docInfo.idMappings.charShapeArray

        expect(array[7].property.isItalic) == true
        expect(array[8].property.isBold) == true
        expect(array[9].property.underlineType) == .under
        expect(array[10].property.borderlineType) == .line
        expect(array[11].property.shadowType) == .discontinuous
        expect(array[12].property.shadowType) == .continuous
        expect(array[13].property.isRelief) == true
        expect(array[14].property.isCounterRelief) == true
        expect(array[15].property.isSuperscript) == true
        expect(array[16].property.isSubscript) == true
        // TODO: 문서화 필요
        expect(array[18].property.strikethrough) == 1
        expect(array[19].property.emphasisType) == .filledCircle
        expect(array[20].property.doesAdjustBlank) == true
        expect(array[21].property.isKerning) == true
    }
}
