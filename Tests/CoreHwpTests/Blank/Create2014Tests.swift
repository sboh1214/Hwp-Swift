import CoreHwp
import XCTest

/**
 doc version : unknown
 program version : 10.30.3(2478)
 */
final class Create2014Tests: XCTestCase {

    func testCreate() throws {
        // XCTAssertEqual(expected, actual)
    }

    func testfileHeader() throws {
        let (official, this) = try createHwp(#file, "blank-mac2014vp")
        
        XCTAssertEqual(official.fileHeader, this.fileHeader)
    }

    func testDocInfo() throws {
        let (official, this) = try createHwp(#file, "blank-mac2014vp")
        
        XCTAssertEqual(official.docInfo.documentProperties, this.docInfo.documentProperties)
        XCTAssertEqual(official.docInfo.compatibleDocument, this.docInfo.compatibleDocument)
        let officialMappings = official.docInfo.idMappings
        let thisMappings = this.docInfo.idMappings
        // XCTAssertEqual(expectedMappings.faceNameArray, actualMappings.faceNameArray)
        XCTAssertEqual(officialMappings.borderFillArray, thisMappings.borderFillArray)
        // XCTAssertEqual(officialMappings.charShapeArray, thisMappings.charShapeArray)
        XCTAssertEqual(officialMappings.paraShapeArray, thisMappings.paraShapeArray)
        XCTAssertEqual(officialMappings.forbiddenCharArray, thisMappings.forbiddenCharArray)

        // XCTAssertEqual(expected.docInfo, actual.docInfo)
    }

    func testSectionArray() throws {
        let (official, this) = try createHwp(#file, "blank-mac2014vp")
        
        XCTAssertEqual(official.sectionArray.count, this.sectionArray.count)

        //XCTAssertEqual(official.sectionArray, this.sectionArray)
    }
}
