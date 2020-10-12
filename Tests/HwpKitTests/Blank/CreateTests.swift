import HwpKit
import XCTest

final class CreateTests: XCTestCase {
    func createHwp() throws -> (HwpFile, HwpFile) {
        let url = URL(fileURLWithPath: #file)
            .deletingLastPathComponent()
            .appendingPathComponent("blank-mac2014vp.hwp")
        let expected =  try HwpFile(filePath: url.path)
        let actual = HwpFile()
        return (expected, actual)
    }

    func testCreate() throws {
        let (_, _) = try createHwp()
        // XCTAssertEqual(expected, actual)
    }

    func testfileHeader() throws {
        let (expected, actual) = try createHwp()
        XCTAssertEqual(expected.fileHeader, actual.fileHeader)
    }

    func testDocInfo() throws {
        let (expected, actual) = try createHwp()

        XCTAssertEqual(expected.docInfo.documentProperties, actual.docInfo.documentProperties)
        XCTAssertEqual(expected.docInfo.compatibleDocument, actual.docInfo.compatibleDocument)
        // XCTAssertEqual(expected.docInfo.idMappings, actual.docInfo.idMappings)

        // XCTAssertEqual(expected.docInfo, actual.docInfo)
    }

    func testSectionArray() throws {
        let (expected, actual) = try createHwp()

        XCTAssertEqual(expected.sectionArray.count, actual.sectionArray.count)

        XCTAssertEqual(expected.sectionArray, actual.sectionArray)
    }
}
