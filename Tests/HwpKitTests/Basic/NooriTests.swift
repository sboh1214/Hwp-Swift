import HwpKit
import XCTest

final class NooriTests: XCTestCase {
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

    static var allTests = [
        ("testSectionSize", testSectionSize),
        ("testStartingIndex", testStartingIndex),
        ("testCaratLocation", testCaratLocation),
        ("testBinData", testBinData)
    ]
}
