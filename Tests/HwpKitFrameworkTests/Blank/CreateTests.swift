import HwpKitFramework
import XCTest

final class CreateTests: XCTestCase {
    let (expected, actual) = createHwp(#file, "blank-mac2014vp")

    func testCreate() throws {
        // XCTAssertEqual(expected, actual)
    }

    func testfileHeader() throws {
        XCTAssertEqual(expected.fileHeader, actual.fileHeader)
    }

    func testDocInfo() throws {
        XCTAssertEqual(expected.docInfo.documentProperties, actual.docInfo.documentProperties)
        XCTAssertEqual(expected.docInfo.compatibleDocument, actual.docInfo.compatibleDocument)
        // XCTAssertEqual(expected.docInfo.idMappings, actual.docInfo.idMappings)

        // XCTAssertEqual(expected.docInfo, actual.docInfo)
    }

    func testSectionArray() throws {
        XCTAssertEqual(expected.sectionArray.count, actual.sectionArray.count)

        XCTAssertEqual(expected.sectionArray, actual.sectionArray)
    }
}
