import HwpKit
import XCTest

final class NooriDocInfoTests: XCTestCase {
    func openHwp() throws -> HwpFile {
        let url = URL(fileURLWithPath: #file)
            .deletingLastPathComponent()
            .appendingPathComponent("noori.hwp")
        return try HwpFile(filePath: url.path)
    }

    func testSectionSize() throws {
        let hwp = try openHwp()
        XCTAssertEqual(hwp.docInfo.documentProperties.sectionSize, 1)
    }

    func testStartingIndex() throws {
        let hwp = try openHwp()
        let index = hwp.docInfo.documentProperties.startingIndex
        XCTAssertEqual(index.page, 1)
        XCTAssertEqual(index.footnote, 1)
        XCTAssertEqual(index.endnote, 1)
        XCTAssertEqual(index.picture, 1)
        XCTAssertEqual(index.table, 1)
        XCTAssertEqual(index.equation, 1)
    }

    func testCaratLocation() throws {
        let hwp = try openHwp()
        let location = hwp.docInfo.documentProperties.caratLocation
        XCTAssertEqual(location.listId, 11)
        XCTAssertEqual(location.paragraphId, 2)
        XCTAssertEqual(location.charIndex, 14)
    }

    func testBinData() throws {
        let hwp = try openHwp()
        let bin = hwp.docInfo.binDataArray
        XCTAssertEqual(bin[0].extensionName!.toString(), "jpg")
        XCTAssertEqual(bin[1].extensionName!.toString(), "bmp")
        XCTAssertEqual(bin[2].extensionName!.toString(), "bmp")
        XCTAssertEqual(bin[3].extensionName!.toString(), "jpg")
    }

    func testFaceName() throws {
        let hwp = try openHwp()
        let face = hwp.docInfo.faceNameArray
        XCTAssertEqual(face[0].faceName.toString(), "굴림")
        XCTAssertEqual(face[0].alternativeFaceName, nil)
        XCTAssertEqual(face[0].defaultFaceName!.toString(), "Gulim")

        XCTAssertEqual(face[1].faceName.toString(), "굴림체")
        XCTAssertEqual(face[1].alternativeFaceName, nil)
        XCTAssertEqual(face[1].defaultFaceName!.toString(), "GulimChe")

        XCTAssertEqual(face[72].faceName.toString(), "Myeongjo")
        XCTAssertEqual(face[72].alternativeFaceName!.toString(), "명조")
        XCTAssertEqual(face[72].defaultFaceName, nil)
    }

    func testBorderFill() throws {
        let hwp = try openHwp()
        let border = hwp.docInfo.borderFillArray
        XCTAssertEqual(border[0].borderColor[0], HwpColor(0, 0, 0))
    }

    func testCharShape() throws {
        let hwp = try openHwp()
        let char = hwp.docInfo.charShapeArray
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
        let hwp = try openHwp()
        let shape = hwp.docInfo.paraShapeArray
        XCTAssertEqual(shape[0].property1, 128)
        XCTAssertEqual(shape[46].property1, 268)
    }

    func testCtrlHeader() throws {
        let hwp = try openHwp()
        XCTAssertEqual(hwp.sectionArray[0].paragraph[2].ctrlHeaderArray![0].ctrlId, 1885826672)
    }

    static var allTests = [
        ("testSectionSize", testSectionSize),
        ("testStartingIndex", testStartingIndex),
        ("testCaratLocation", testCaratLocation),
        ("testBinData", testBinData),
        ("testFaceName", testFaceName),
        ("testBorderFill", testBorderFill),
        ("testCharShape", testCharShape),
        ("testTabDef", testTabDef),
        ("testCtrlHeader", testCtrlHeader)
    ]
}
