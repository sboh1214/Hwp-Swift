import HwpKit
import XCTest

final class BlankTests: XCTestCase {
    func openHwp() throws -> HwpFile {
        let url = URL(fileURLWithPath: #file)
            .deletingLastPathComponent()
            .appendingPathComponent("blank-mac2014vp.hwp")
        return try HwpFile(filePath: url.path)
    }

    func testOpen() throws {
        let hwp = try openHwp()
        XCTAssertNotNil(hwp.fileHeader)
    }

    func testSignature() throws {
        let hwp = try openHwp()
        XCTAssertEqual(hwp.fileHeader.signature, "HWP Document File\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0")
    }

    func testHwpVersion() throws {
        let hwp = try openHwp()
        XCTAssertEqual(hwp.fileHeader.version.major, 5)
        XCTAssertEqual(hwp.fileHeader.version.minor, 1)
        XCTAssertEqual(hwp.fileHeader.version.build, 0)
        XCTAssertEqual(hwp.fileHeader.version.revision, 1)
    }

    func testEncryptVersion() throws {
        let hwp = try openHwp()
        XCTAssertEqual(hwp.fileHeader.encryptVersion, 4)
    }
}
