import CoreHwp
import XCTest

final class NooriSectionTests: XCTestCase {

    func testParagraph() throws {
        let hwp = try openHwp(#file, "noori")
        
        for index in 0...20 {
            XCTAssertNotNil(hwp.sectionArray[0].paragraph[index])
        }
    }

    func testParaText() throws {
        let hwp = try openHwp(#file, "noori")
        
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
        let hwp = try openHwp(#file, "noori")
        
        XCTAssertEqual(hwp.sectionArray[0].paragraph[0].paraCharShape.startingIndex[0], 0)
        XCTAssertEqual(hwp.sectionArray[0].paragraph[0].paraCharShape.shapeId[0], 19)
        XCTAssertEqual(hwp.sectionArray[0].paragraph[20].paraCharShape.startingIndex[0], 0)
        XCTAssertEqual(hwp.sectionArray[0].paragraph[20].paraCharShape.shapeId[0], 30)
    }

    func testParaLineSeg() throws {
        let hwp = try openHwp(#file, "noori")
        
        let seg0 = hwp.sectionArray[0].paragraph[0].paraLineSeg.paraLineSegInternalArray[0]
        XCTAssertEqual(seg0.textStartingIndex, 0)
        XCTAssertEqual(seg0.lineLocation, 0)
        XCTAssertEqual(seg0.lineHeight, 6134)
        XCTAssertEqual(seg0.textHeight, 6134)
        XCTAssertEqual(seg0.baselineDistance, 5214)
        XCTAssertEqual(seg0.lineSpacing, 840)
        XCTAssertEqual(seg0.startingLocation, 0)
        XCTAssertEqual(seg0.width, 48188)

        XCTAssertNotNil(hwp.sectionArray[0].paragraph[20].paraLineSeg)
    }

    func testTable() throws {
        let hwp = try openHwp(#file, "noori")
        
        switch hwp.sectionArray[0].paragraph[1].ctrlHeaderArray![0] {
        case .table(let hwpTable):
            XCTAssertEqual(hwpTable.commonCtrlProperty.verticalOffset, 0)
            XCTAssertEqual(hwpTable.commonCtrlProperty.horizontalOffset, 0)
            XCTAssertEqual(hwpTable.commonCtrlProperty.width, 48230)
            XCTAssertEqual(hwpTable.commonCtrlProperty.height, 6869)
            XCTAssertEqual(hwpTable.commonCtrlProperty.zOrder, 0)
        default:
            XCTFail("Ctrl is not Table")
        }
    }

    func testGenShapeObject() throws {
        let hwp = try openHwp(#file, "noori")
        
        switch hwp.sectionArray[0].paragraph[0].ctrlHeaderArray![2] {
        case .genShapeObject(let hwpGenShapeObject):
            XCTAssertEqual(hwpGenShapeObject.commonCtrlProperty.verticalOffset, 0)
            XCTAssertEqual(hwpGenShapeObject.commonCtrlProperty.horizontalOffset, 0)
            XCTAssertEqual(hwpGenShapeObject.commonCtrlProperty.width, 48104)
            XCTAssertEqual(hwpGenShapeObject.commonCtrlProperty.height, 6134)
            XCTAssertEqual(hwpGenShapeObject.commonCtrlProperty.zOrder, 8)
        default:
            XCTFail("Ctrl is not GenShapeObject")
        }
    }

    func testColumn() throws {
        let hwp = try openHwp(#file, "noori")
        
        switch hwp.sectionArray[0].paragraph[0].ctrlHeaderArray![1] {
        case .column(let hwpColumn):
            XCTAssertEqual(hwpColumn.widthArray.count, 1)
        default:
            XCTFail("Ctrl is not Column")
        }
    }
}
