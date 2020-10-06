import HwpKit
import XCTest

final class NooriSectionTests: XCTestCase {
    func openHwp() throws -> HwpFile {
        let url = URL(fileURLWithPath: #file)
            .deletingLastPathComponent()
            .appendingPathComponent("noori.hwp")
        return try HwpFile(filePath: url.path)
    }

    func testParagraph() throws {
        let hwp = try openHwp()
        for index in 0...20 {
            XCTAssertNotNil(hwp.sectionArray[0].paragraph[index])
        }
    }

    func testParaText() throws {
        let hwp = try openHwp()
        let text = hwp.sectionArray[0].paragraph[0].paraText
        XCTAssertEqual(text!.charArray[0].type, .extended)
        XCTAssertEqual(text!.charArray[3].type, .char)

        XCTAssertEqual(text!.charArray[0].value, 2)
        XCTAssertEqual(text!.charArray[2].value, 11)
        XCTAssertEqual(text!.charArray[3].value, 13)

        XCTAssertNil(hwp.sectionArray[0].paragraph[15].paraText)
        XCTAssertNil(hwp.sectionArray[0].paragraph[16].paraText)
        XCTAssertNil(hwp.sectionArray[0].paragraph[17].paraText)
    }

    func testParaCharShape() throws {
        let hwp = try openHwp()
        XCTAssertEqual(hwp.sectionArray[0].paragraph[0].paraCharShape?.startingIndex[0], 0)
        XCTAssertEqual(hwp.sectionArray[0].paragraph[0].paraCharShape?.shapeId[0], 19)
        XCTAssertEqual(hwp.sectionArray[0].paragraph[20].paraCharShape?.startingIndex[0], 0)
        XCTAssertEqual(hwp.sectionArray[0].paragraph[20].paraCharShape?.shapeId[0], 30)
    }

    func testParaLineSeg() throws {
        let hwp = try openHwp()
        let seg0 = hwp.sectionArray[0].paragraph[0].paraLineSegArray![0]
        XCTAssertEqual(seg0.textStartingIndex, 0)
        XCTAssertEqual(seg0.lineLocation, 0)
        XCTAssertEqual(seg0.lineHeight, 6134)
        XCTAssertEqual(seg0.textHeight, 6134)
        XCTAssertEqual(seg0.baselineDistance, 5214)
        XCTAssertEqual(seg0.lineSpacing, 840)
        XCTAssertEqual(seg0.startingLocation, 0)
        XCTAssertEqual(seg0.width, 48188)

        XCTAssertNotNil(hwp.sectionArray[0].paragraph[20].paraLineSegArray![0])
    }

    static var allTests = [
        ("testParagraph", testParagraph),
        ("testParaText", testParaText),
        ("testParaCharShape", testParaCharShape),
        ("testParaLineSeg", testParaLineSeg)
    ]
}
