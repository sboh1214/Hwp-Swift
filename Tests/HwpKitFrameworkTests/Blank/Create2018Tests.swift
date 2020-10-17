//
//  afds.swift
//  HwpKitFrameworkTests
//
//  Created by Seungbin Oh on 2020/10/12.
//

import XCTest

/**
 doc  version : 5.1.0.1.1
 program version : 10.0.0.5060
 */
class Create2018Tests: XCTestCase {
    let (official, this) = createHwp(#file, "blank-win2018")

    func testCreate() throws {
        // XCTAssertEqual(expected, actual)
    }

    func testfileHeader() throws {
        XCTAssertEqual(official.fileHeader, this.fileHeader)
    }

    func testDocInfo() throws {
        XCTAssertEqual(official.docInfo.documentProperties, this.docInfo.documentProperties)
        XCTAssertEqual(official.docInfo.compatibleDocument, this.docInfo.compatibleDocument)

        let expectedMappings = official.docInfo.idMappings
        let actualMappings = this.docInfo.idMappings

        XCTAssertEqual(expectedMappings.faceNameKoreanArray, actualMappings.faceNameKoreanArray)
        XCTAssertEqual(expectedMappings.faceNameEnglishArray, actualMappings.faceNameEnglishArray)
        XCTAssertEqual(expectedMappings.faceNameChineseArray, actualMappings.faceNameChineseArray)
        XCTAssertEqual(expectedMappings.faceNameJapaneseArray, actualMappings.faceNameJapaneseArray)
        XCTAssertEqual(expectedMappings.faceNameEtcArray, actualMappings.faceNameEtcArray)
        XCTAssertEqual(expectedMappings.faceNameSymbolArray, actualMappings.faceNameSymbolArray)
        XCTAssertEqual(expectedMappings.faceNameUserArray, actualMappings.faceNameUserArray)

        XCTAssertEqual(expectedMappings.borderFillArray, actualMappings.borderFillArray)
        XCTAssertEqual(expectedMappings.charShapeArray, actualMappings.charShapeArray)
        XCTAssertEqual(expectedMappings.tabDefArray, actualMappings.tabDefArray)
        XCTAssertEqual(expectedMappings.numberingArray, actualMappings.numberingArray)
        XCTAssertEqual(expectedMappings.paraShapeArray, actualMappings.paraShapeArray)
        XCTAssertEqual(expectedMappings.styleArray, actualMappings.styleArray)

        //XCTAssertEqual(expected.docInfo, actual.docInfo)
    }

    func testSectionArray() throws {
        XCTAssertEqual(official.sectionArray.count, this.sectionArray.count)

        // XCTAssertEqual(expected.sectionArray, actual.sectionArray)
    }
}
