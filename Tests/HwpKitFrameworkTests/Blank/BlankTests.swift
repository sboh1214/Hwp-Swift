import HwpKitFramework
import XCTest

final class BlankTests: XCTestCase {
    let hwp = openHwp(#file, "blank-mac2014vp")

    func testOpen() throws {
        XCTAssertNotNil(hwp.fileHeader)
    }

    func testSignature() throws {
        XCTAssertEqual(hwp.fileHeader.signature, "HWP Document File\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0")
    }

    func testHwpVersion() throws {
        XCTAssertEqual(hwp.fileHeader.version.major, 5)
        XCTAssertEqual(hwp.fileHeader.version.minor, 1)
        XCTAssertEqual(hwp.fileHeader.version.build, 0)
        XCTAssertEqual(hwp.fileHeader.version.revision, 1)
    }

    func testEncryptVersion() throws {
        XCTAssertEqual(hwp.fileHeader.encryptVersion, 4)
    }
}
