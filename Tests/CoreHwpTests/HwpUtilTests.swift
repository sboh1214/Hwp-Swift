import XCTest
@testable import CoreHwp
import SWCompression

final class HwpUtilTests: XCTestCase {
    func testBitsFromInt8() {
        let byte = UInt8(0x4A)
        let bits = [false, true, false, false, true, false, true, false].reversed() as [Bool]
        XCTAssertEqual(bits, byte.bits)
    }

    func testCompressUncompress() throws {
        let testData = "Hello World".data(using: .utf16LittleEndian)!

        let compressed = Deflate.compress(data: testData)
        let decompressed = try Deflate.decompress(data: compressed)

        XCTAssertEqual(testData, decompressed)

    }

    private func makeCtrlId(_ string: String) -> UInt32 {
        precondition(string.count == 4)
        let array = string.asciiValues.map {UInt32($0)}
        return array[0] << 24 + array[1] << 16 + array[2] << 8 + array[3]
    }

    func testCommonCtrlId() throws {
        XCTAssertEqual(HwpCommonCtrlId.table.rawValue, makeCtrlId("tbl "))

        XCTAssertEqual(HwpCommonCtrlId.line.rawValue, makeCtrlId("$lin"))
        XCTAssertEqual(HwpCommonCtrlId.rectangle.rawValue, makeCtrlId("$rec"))
        XCTAssertEqual(HwpCommonCtrlId.ellipse.rawValue, makeCtrlId("$ell"))
        XCTAssertEqual(HwpCommonCtrlId.arc.rawValue, makeCtrlId("$arc"))
        XCTAssertEqual(HwpCommonCtrlId.polygon.rawValue, makeCtrlId("$pol"))
        XCTAssertEqual(HwpCommonCtrlId.curve.rawValue, makeCtrlId("$cur"))

        XCTAssertEqual(HwpCommonCtrlId.equation.rawValue, makeCtrlId("equd"))
        XCTAssertEqual(HwpCommonCtrlId.picture.rawValue, makeCtrlId("$pic"))
        XCTAssertEqual(HwpCommonCtrlId.ole.rawValue, makeCtrlId("$ole"))
        XCTAssertEqual(HwpCommonCtrlId.container.rawValue, makeCtrlId("$con"))

        XCTAssertEqual(HwpCommonCtrlId.genShapeObject.rawValue, makeCtrlId("gso "))
    }

    func testOtherCtrlID() throws {
        XCTAssertEqual(HwpOtherCtrlId.section.rawValue, makeCtrlId("secd"))
        XCTAssertEqual(HwpOtherCtrlId.column.rawValue, makeCtrlId("cold"))
        XCTAssertEqual(HwpOtherCtrlId.header.rawValue, makeCtrlId("head"))
        XCTAssertEqual(HwpOtherCtrlId.footer.rawValue, makeCtrlId("foot"))
        XCTAssertEqual(HwpOtherCtrlId.footnote.rawValue, makeCtrlId("fn  "))
        XCTAssertEqual(HwpOtherCtrlId.endnote.rawValue, makeCtrlId("en  "))
        XCTAssertEqual(HwpOtherCtrlId.autoNumber.rawValue, makeCtrlId("atno"))
        XCTAssertEqual(HwpOtherCtrlId.newNumber.rawValue, makeCtrlId("nwno"))
        XCTAssertEqual(HwpOtherCtrlId.pageHide.rawValue, makeCtrlId("pghd"))
        XCTAssertEqual(HwpOtherCtrlId.pageCT.rawValue, makeCtrlId("pgct"))
        XCTAssertEqual(HwpOtherCtrlId.pageNumberPosition.rawValue, makeCtrlId("pgnp"))
        XCTAssertEqual(HwpOtherCtrlId.indexmark.rawValue, makeCtrlId("idxm"))
        XCTAssertEqual(HwpOtherCtrlId.bookmark.rawValue, makeCtrlId("bokm"))
        XCTAssertEqual(HwpOtherCtrlId.overlapping.rawValue, makeCtrlId("tcps"))
        XCTAssertEqual(HwpOtherCtrlId.comment.rawValue, makeCtrlId("tdut"))
        XCTAssertEqual(HwpOtherCtrlId.hiddenComment.rawValue, makeCtrlId("tcmt"))
    }

    func testFieldCtrlId() throws {
        XCTAssertEqual(HwpFieldCtrlId.unknown.rawValue, makeCtrlId("%unk"))
        XCTAssertEqual(HwpFieldCtrlId.date.rawValue, makeCtrlId("$dte"))
        XCTAssertEqual(HwpFieldCtrlId.docDate.rawValue, makeCtrlId("%ddt"))
        XCTAssertEqual(HwpFieldCtrlId.path.rawValue, makeCtrlId("%pat"))
        XCTAssertEqual(HwpFieldCtrlId.bookmark.rawValue, makeCtrlId("%bmk"))
        XCTAssertEqual(HwpFieldCtrlId.mailMerge.rawValue, makeCtrlId("%mmg"))
        XCTAssertEqual(HwpFieldCtrlId.crossRef.rawValue, makeCtrlId("%xrf"))
        XCTAssertEqual(HwpFieldCtrlId.formula.rawValue, makeCtrlId("%fmu"))
        XCTAssertEqual(HwpFieldCtrlId.clickHere.rawValue, makeCtrlId("%clk"))
        XCTAssertEqual(HwpFieldCtrlId.summary.rawValue, makeCtrlId("%smr"))
        XCTAssertEqual(HwpFieldCtrlId.userInfo.rawValue, makeCtrlId("%usr"))
        XCTAssertEqual(HwpFieldCtrlId.hyperLink.rawValue, makeCtrlId("%hlk"))

        XCTAssertEqual(HwpFieldCtrlId.revisionSign.rawValue, makeCtrlId("%sig"))
        XCTAssertEqual(HwpFieldCtrlId.revisionDelete.rawValue, makeCtrlId("%%*d"))
        XCTAssertEqual(HwpFieldCtrlId.revisionAttach.rawValue, makeCtrlId("%%*a"))
        XCTAssertEqual(HwpFieldCtrlId.revisionClipping.rawValue, makeCtrlId("%%*C"))
        XCTAssertEqual(HwpFieldCtrlId.revisionSawtooth.rawValue, makeCtrlId("%%*S"))
        XCTAssertEqual(HwpFieldCtrlId.revisionThinking.rawValue, makeCtrlId("%%*T"))
        XCTAssertEqual(HwpFieldCtrlId.revisionPraise.rawValue, makeCtrlId("%%*P"))
        XCTAssertEqual(HwpFieldCtrlId.revisionLine.rawValue, makeCtrlId("%%*L"))
        XCTAssertEqual(HwpFieldCtrlId.revisionSimpleChange.rawValue, makeCtrlId("%%*c"))
        XCTAssertEqual(HwpFieldCtrlId.revisionHyperLink.rawValue, makeCtrlId("%%*h"))
        XCTAssertEqual(HwpFieldCtrlId.revisionLineAttach.rawValue, makeCtrlId("%%*A"))
        XCTAssertEqual(HwpFieldCtrlId.revisionLineLink.rawValue, makeCtrlId("%%*i"))
        XCTAssertEqual(HwpFieldCtrlId.revisionLineRansfer.rawValue, makeCtrlId("%%*t"))
        XCTAssertEqual(HwpFieldCtrlId.revisionRightMove.rawValue, makeCtrlId("%%*r"))
        XCTAssertEqual(HwpFieldCtrlId.revisionLeftMove.rawValue, makeCtrlId("%%&l"))
        XCTAssertEqual(HwpFieldCtrlId.revisionTransfer.rawValue, makeCtrlId("%%*n"))
        XCTAssertEqual(HwpFieldCtrlId.revisionSimpleInsert.rawValue, makeCtrlId("%%*e"))
        XCTAssertEqual(HwpFieldCtrlId.revisionSplit.rawValue, makeCtrlId("%spl"))
        XCTAssertEqual(HwpFieldCtrlId.revisionChange.rawValue, makeCtrlId("%%mr"))

        XCTAssertEqual(HwpFieldCtrlId.memo.rawValue, makeCtrlId("%%me"))
        XCTAssertEqual(HwpFieldCtrlId.privateInfoSecurity.rawValue, makeCtrlId("%cpr"))
        XCTAssertEqual(HwpFieldCtrlId.tableOfContents.rawValue, makeCtrlId("%toc"))
    }
}
