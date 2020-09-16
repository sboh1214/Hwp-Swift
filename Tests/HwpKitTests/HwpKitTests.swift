import XCTest
@testable import HwpKit

final class HwpKitTests: XCTestCase {
    func openHwp() throws -> HwpFile {
        let url = URL(fileURLWithPath: #file)
            .deletingLastPathComponent()
            .appendingPathComponent("SampleHwp")
            .appendingPathComponent("blank.hwp")
        return try HwpFile(filePath: url.path)
    }

    func testOpen() throws {
        let hwp = try openHwp()
        XCTAssertNotNil(hwp.ole)
        XCTAssertNotNil(hwp.fileHeader)
    }

    func testSignature() throws {
        let hwp = try openHwp()
        dump(hwp.fileHeader.signature)
        XCTAssertNotEqual(hwp.fileHeader.signature, "Error")
        //B4 A5 00
    }

    func testHwpVersion() throws {
        let hwp = try openHwp()
        XCTAssertEqual(hwp.fileHeader.major, 5)
        XCTAssertEqual(hwp.fileHeader.minor, 0)
        XCTAssertEqual(hwp.fileHeader.build, 3)
        XCTAssertEqual(hwp.fileHeader.revision, 4)
    }

    static var allTests = [
        ("testOpen", testOpen),
        ("testSignature", testSignature),
        ("testHwpVersion", testHwpVersion)
    ]
}
