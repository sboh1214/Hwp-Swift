import CoreHwp
import XCTest

final class BlankTests: XCTestCase {

    func testOpen() throws {
        let hwp = try openHwp(#file, "blank-mac2014vp")
        XCTAssertNotNil(hwp.fileHeader)
    }

    func testSignature() throws {
        let hwp = try openHwp(#file, "blank-mac2014vp")
        XCTAssertEqual(hwp.fileHeader.signature, "HWP Document File\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0")
    }

    func testHwpVersion() throws {
        let hwp = try openHwp(#file, "blank-mac2014vp")
        XCTAssertEqual(hwp.fileHeader.version, HwpVersion(5, 1, 0, 1))
    }

    func testEncryptVersion() throws {
        let hwp = try openHwp(#file, "blank-mac2014vp")
        XCTAssertEqual(hwp.fileHeader.encryptVersion, 4)
    }
}
