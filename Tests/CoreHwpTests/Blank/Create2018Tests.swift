import XCTest
import Nimble

/**
 doc  version : 5.1.0.1.1
 program version : 10.0.0.5060
 */
class Create2018Tests: XCTestCase {

    func testCreate() throws {
        // expect(expected, actual)
    }

    func testfileHeader() throws {
        let (official, this) = try createHwp(#file, "blank-win2018")

        expect(official.fileHeader) == this.fileHeader
    }

    func testDocInfo() throws {
        let (official, this) = try createHwp(#file, "blank-win2018")

        expect(official.docInfo.documentProperties) == this.docInfo.documentProperties
        expect(official.docInfo.compatibleDocument) == this.docInfo.compatibleDocument

        let expectedMappings = official.docInfo.idMappings
        let actualMappings = this.docInfo.idMappings

        expect(expectedMappings.faceNameKoreanArray) == actualMappings.faceNameKoreanArray
        expect(expectedMappings.faceNameEnglishArray) == actualMappings.faceNameEnglishArray
        expect(expectedMappings.faceNameChineseArray) == actualMappings.faceNameChineseArray
        expect(expectedMappings.faceNameJapaneseArray) == actualMappings.faceNameJapaneseArray
        expect(expectedMappings.faceNameEtcArray) == actualMappings.faceNameEtcArray
        expect(expectedMappings.faceNameSymbolArray) == actualMappings.faceNameSymbolArray
        expect(expectedMappings.faceNameUserArray) == actualMappings.faceNameUserArray

        expect(expectedMappings.borderFillArray) == actualMappings.borderFillArray
        expect(expectedMappings.charShapeArray) == actualMappings.charShapeArray
        expect(expectedMappings.tabDefArray) == actualMappings.tabDefArray
        expect(expectedMappings.numberingArray) == actualMappings.numberingArray
        expect(expectedMappings.paraShapeArray) == actualMappings.paraShapeArray
        expect(expectedMappings.styleArray) == actualMappings.styleArray

        // expect(expected.docInfo, actual.docInfo)
    }

    func testSectionArray() throws {
        let (official, this) = try createHwp(#file, "blank-win2018")

        expect(official.sectionArray.count) == this.sectionArray.count

        // expect(expected.sectionArray, actual.sectionArray)
    }
}
