import HwpKitFramework
import XCTest

final class NooriDocInfoTests: XCTestCase {
    let hwp = openHwp(#file, "noori")

    func testSectionSize() throws {
        XCTAssertEqual(hwp.docInfo.documentProperties.sectionSize, 1)
    }

    func testStartingIndex() throws {
        let index = hwp.docInfo.documentProperties.startingIndex
        XCTAssertEqual(index.page, 1)
        XCTAssertEqual(index.footnote, 1)
        XCTAssertEqual(index.endnote, 1)
        XCTAssertEqual(index.picture, 1)
        XCTAssertEqual(index.table, 1)
        XCTAssertEqual(index.equation, 1)
    }

    func testCaratLocation() throws {
        let location = hwp.docInfo.documentProperties.caratLocation
        XCTAssertEqual(location.listId, 11)
        XCTAssertEqual(location.paragraphId, 2)
        XCTAssertEqual(location.charIndex, 14)
    }

    func testBinData() throws {
        let bin = hwp.docInfo.idMappings.binDataArray
        XCTAssertEqual(bin[0].extensionName!.string, "jpg")
        XCTAssertEqual(bin[1].extensionName!.string, "bmp")
        XCTAssertEqual(bin[2].extensionName!.string, "bmp")
        XCTAssertEqual(bin[3].extensionName!.string, "jpg")
    }

    func testFaceName() throws {
        let face = hwp.docInfo.idMappings.faceNameArray
        XCTAssertEqual(face[0].faceName, "굴림")
        XCTAssertEqual(face[0].alternativeFaceName, nil)
        XCTAssertEqual(face[0].defaultFaceName!, "Gulim")

        XCTAssertEqual(face[1].faceName, "굴림체")
        XCTAssertEqual(face[1].alternativeFaceName, nil)
        XCTAssertEqual(face[1].defaultFaceName!, "GulimChe")

        XCTAssertEqual(face[72].faceName, "Myeongjo")
        XCTAssertEqual(face[72].alternativeFaceName!, "명조")
        XCTAssertEqual(face[72].defaultFaceName, nil)
    }

    func testBorderFill() throws {
        let border = hwp.docInfo.idMappings.borderFillArray
        XCTAssertEqual(border[0].borderColor[0], HwpColor(0, 0, 0))
    }

    func testCharShape() throws {
        let char = hwp.docInfo.idMappings.charShapeArray
        XCTAssertEqual(char[0].property, 0)
        XCTAssertEqual(char[0].faceColor, HwpColor(0, 0, 0))
        XCTAssertEqual(char[0].borderFillId, 2)
        XCTAssertEqual(char[0].faceId, [5, 5, 5, 5, 5, 5, 5])
        XCTAssertEqual(char[0].faceLocation, [0, 0, 0, 0, 0, 0, 0])
        XCTAssertEqual(char[0].faceRelativeSize, Array(repeating: 100, count: 7))
        XCTAssertEqual(char[0].faceScaleX, Array(repeating: 100, count: 7))
        XCTAssertEqual(char[0].shadeColor, HwpColor(255, 255, 255))
        XCTAssertEqual(char[0].shadowColor, HwpColor(178, 178, 178))
        XCTAssertEqual(char[0].underlineColor, HwpColor(0, 0, 0))
        XCTAssertEqual(char[0].strikethroughColor!, HwpColor(0, 0, 0))

        XCTAssertEqual(char[58].property, 2)
    }

    func testTabDef() throws {
        let shape = hwp.docInfo.idMappings.paraShapeArray
        XCTAssertEqual(shape[0].property1, 128)
        XCTAssertEqual(shape[46].property1, 268)
    }

    func testCtrlHeader() throws {
        XCTAssertEqual(hwp.sectionArray[0].paragraph[2].ctrlHeaderArray![0].ctrlId, 1885826672)
    }

    func testCompatibleDocument() throws {
        let compatible = hwp.docInfo.compatibleDocument
        XCTAssertEqual(compatible!.targetDocument, 0)
        XCTAssertEqual(compatible!.layoutCompatibility!.char, 0)
        XCTAssertEqual(compatible!.layoutCompatibility!.paragraph, 0)
        XCTAssertEqual(compatible!.layoutCompatibility!.section, 0)
        XCTAssertEqual(compatible!.layoutCompatibility!.object, 0)
        XCTAssertEqual(compatible!.layoutCompatibility!.field, 0)
    }
}
