import XCTest
@testable import HwpKitFramework
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
        XCTAssertEqual(HwpFieldCtrlId.Unknown.rawValue, makeCtrlId("%unk"))
        XCTAssertEqual(HwpFieldCtrlId.Date.rawValue, makeCtrlId("$dte"))
        XCTAssertEqual(HwpFieldCtrlId.DocDate.rawValue, makeCtrlId("%ddt"))
        XCTAssertEqual(HwpFieldCtrlId.Path.rawValue, makeCtrlId("%pat"))
        XCTAssertEqual(HwpFieldCtrlId.Bookmark.rawValue, makeCtrlId("%bmk"))
        XCTAssertEqual(HwpFieldCtrlId.MailMerge.rawValue, makeCtrlId("%mmg"))
        XCTAssertEqual(HwpFieldCtrlId.CrossRef.rawValue, makeCtrlId("%xrf"))
        XCTAssertEqual(HwpFieldCtrlId.Formula.rawValue, makeCtrlId("%fmu"))
        XCTAssertEqual(HwpFieldCtrlId.ClickHere.rawValue, makeCtrlId("%clk"))
        XCTAssertEqual(HwpFieldCtrlId.Summary.rawValue, makeCtrlId("%smr"))
        XCTAssertEqual(HwpFieldCtrlId.UserInfo.rawValue, makeCtrlId("%usr"))
        XCTAssertEqual(HwpFieldCtrlId.HyperLink.rawValue, makeCtrlId("%hlk"))

        XCTAssertEqual(HwpFieldCtrlId.RevisionSign.rawValue, makeCtrlId("%sig"))
        XCTAssertEqual(HwpFieldCtrlId.RevisionDelete.rawValue, makeCtrlId("%%*d"))
        XCTAssertEqual(HwpFieldCtrlId.RevisionAttach.rawValue, makeCtrlId("%%*a"))
        XCTAssertEqual(HwpFieldCtrlId.RevisionClipping.rawValue, makeCtrlId("%%*C"))
        XCTAssertEqual(HwpFieldCtrlId.RevisionSawtooth.rawValue, makeCtrlId("%%*S"))
        XCTAssertEqual(HwpFieldCtrlId.RevisionThinking.rawValue, makeCtrlId("%%*T"))
        XCTAssertEqual(HwpFieldCtrlId.RevisionPraise.rawValue, makeCtrlId("%%*P"))
        XCTAssertEqual(HwpFieldCtrlId.RevisionLine.rawValue, makeCtrlId("%%*L"))
        XCTAssertEqual(HwpFieldCtrlId.RevisionSimpleChange.rawValue, makeCtrlId("%%*c"))
        XCTAssertEqual(HwpFieldCtrlId.RevisionHyperLink.rawValue, makeCtrlId("%%*h"))
        XCTAssertEqual(HwpFieldCtrlId.RevisionLineAttach.rawValue, makeCtrlId("%%*A"))
        XCTAssertEqual(HwpFieldCtrlId.RevisionLineLink.rawValue, makeCtrlId("%%*i"))
        XCTAssertEqual(HwpFieldCtrlId.RevisionLineRansfer.rawValue, makeCtrlId("%%*t"))
        XCTAssertEqual(HwpFieldCtrlId.RevisionRightMove.rawValue, makeCtrlId("%%*r"))
        XCTAssertEqual(HwpFieldCtrlId.RevisionLeftMove.rawValue, makeCtrlId("%%&l"))
        XCTAssertEqual(HwpFieldCtrlId.RevisionTransfer.rawValue, makeCtrlId("%%*n"))
        XCTAssertEqual(HwpFieldCtrlId.RevisionSimpleInsert.rawValue, makeCtrlId("%%*e"))
        XCTAssertEqual(HwpFieldCtrlId.RevisionSplit.rawValue, makeCtrlId("%spl"))
        XCTAssertEqual(HwpFieldCtrlId.RevisionChange.rawValue, makeCtrlId("%%mr"))

        XCTAssertEqual(HwpFieldCtrlId.Memo.rawValue, makeCtrlId("%%me"))
        XCTAssertEqual(HwpFieldCtrlId.PrivateInfoSecurity.rawValue, makeCtrlId("%cpr"))
        XCTAssertEqual(HwpFieldCtrlId.TableOfContents.rawValue, makeCtrlId("%toc"))
    }
}
