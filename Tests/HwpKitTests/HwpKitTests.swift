import XCTest
import OLEKit
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

    func testOLEKit() throws {
        let url = URL(fileURLWithPath: #file)
                    .deletingLastPathComponent()
                    .appendingPathComponent("SampleHwp")
                    .appendingPathComponent("blank.hwp")
        let ole = try OLEFile(url.path)
        let fileHeaderStream = ole.root.children.first(where: { $0.name == "FileHeader"})!
        let reader = try ole.stream(fileHeaderStream)
        let data = reader.readData(ofLength: 32)
        let signature = String(data: data, encoding: .ascii)
        print(signature)
    }

    static var allTests = [
        ("testOpen", testOpen),
        ("testSignature", testSignature),
        ("testHwpVersion", testHwpVersion)
    ]
}
