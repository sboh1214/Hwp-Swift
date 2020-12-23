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
        let (this, official) = try createHwp(#file, "blank-win2018")

        expect(official.fileHeader) == this.fileHeader
    }

    func testDocInfo() throws {
        let (this, official) = try createHwp(#file, "blank-win2018")

        expect(this.docInfo.documentProperties) == official.docInfo.documentProperties
        expect(this.docInfo.compatibleDocument) == official.docInfo.compatibleDocument

        let thisMappings = this.docInfo.idMappings
        let officialMappings = official.docInfo.idMappings

        expect(thisMappings.faceNameKoreanArray) == officialMappings.faceNameKoreanArray
        expect(thisMappings.faceNameEnglishArray) == officialMappings.faceNameEnglishArray
        expect(thisMappings.faceNameChineseArray) == officialMappings.faceNameChineseArray
        expect(thisMappings.faceNameJapaneseArray) == officialMappings.faceNameJapaneseArray
        expect(thisMappings.faceNameEtcArray) == officialMappings.faceNameEtcArray
        expect(thisMappings.faceNameSymbolArray) == officialMappings.faceNameSymbolArray
        expect(thisMappings.faceNameUserArray) == officialMappings.faceNameUserArray

        expect(thisMappings.borderFillArray) == officialMappings.borderFillArray
        expect(thisMappings.charShapeArray) == officialMappings.charShapeArray
        expect(thisMappings.tabDefArray) == officialMappings.tabDefArray
        expect(thisMappings.numberingArray) == officialMappings.numberingArray
        expect(thisMappings.paraShapeArray) == officialMappings.paraShapeArray
        expect(thisMappings.styleArray) == officialMappings.styleArray

        // expect(this.docInfo) == official.docInfo
    }

    func testSectionArray() throws {
        let (this, official) = try createHwp(#file, "blank-win2018")

        expect(official.sectionArray.count) == this.sectionArray.count

        // expect(expected.sectionArray, actual.sectionArray)
    }
}
