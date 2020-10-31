import CoreHwp
import XCTest

final class VersionTests: XCTestCase {
    func test2007() throws {
        let hwp = openHwp(#file, "2007")
        XCTAssertEqual(hwp.fileHeader.version, HwpVersion(5, 0, 2, 2))
    }

    func test2014VP() throws {
        let hwp = openHwp(#file, "2014VP")
        XCTAssertEqual(hwp.fileHeader.version, HwpVersion(5, 0, 5, 0))
    }
}