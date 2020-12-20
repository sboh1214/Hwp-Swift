import CoreHwp
import XCTest
import Nimble

final class BlankTests: XCTestCase {

    func testSignature() throws {
        let hwp = try openHwp(#file, "blank-mac2014vp")
        expect(hwp.fileHeader.signature) == "HWP Document File\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"
    }

    func testHwpVersion() throws {
        let hwp = try openHwp(#file, "blank-mac2014vp")
        expect(hwp.fileHeader.version) == HwpVersion(5, 1, 0, 1)
    }

    func testEncryptVersion() throws {
        let hwp = try openHwp(#file, "blank-mac2014vp")
        expect(hwp.fileHeader.encryptVersion) == 4
    }
}
