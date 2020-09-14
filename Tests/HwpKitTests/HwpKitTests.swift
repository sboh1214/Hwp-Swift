import XCTest
import OLEKit
@testable import HwpKit

final class HwpKitTests: XCTestCase {
    let positiveURL = URL(fileURLWithPath: #file)
        .deletingLastPathComponent()
        .appendingPathComponent("SampleHwp")
        .appendingPathComponent("blank.hwp")

    func testOpen() throws {
        let hwp = try HwpFile(filePath: positiveURL.path)
        XCTAssertNotNil(hwp.ole)
        XCTAssertNotNil(hwp.fileHeader)
    }

    func testSignature() throws {
        let hwp = try HwpFile(filePath: positiveURL.path)
        dump(hwp.fileHeader.data)
        dump(hwp.fileHeader.build)
        print(hwp.fileHeader.signature)
        //B4 A5 00
    }

    // 5 0 3 4

    func testOLEKit() throws {
        let ole = try OLEFile(positiveURL.path)
        let fileHeaderStream = ole.root.children.first(where: { $0.name == "FileHeader"})!
        let reader = try ole.stream(fileHeaderStream)
        let data = reader.readDataToEnd()

    }

    static var allTests = [
        ("testOpen", testOpen),
        ("testSignature", testSignature),
        ("testOLEKit", testOLEKit)
    ]
}
