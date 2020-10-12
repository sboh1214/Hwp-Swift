import HwpKitFramework
import XCTest

final class VersionTests: XCTestCase {
    func openHwp(_ name: String) throws -> HwpFile {
        let url = URL(fileURLWithPath: #file)
            .deletingLastPathComponent()
            .appendingPathComponent("\(name).hwp")
        return try HwpFile(filePath: url.path)
    }

    func test2007() throws {
        let hwp = try openHwp("2007")
        XCTAssertEqual(hwp.fileHeader.version.major, 5)
        XCTAssertEqual(hwp.fileHeader.version.minor, 0)
        XCTAssertEqual(hwp.fileHeader.version.build, 2)
        XCTAssertEqual(hwp.fileHeader.version.revision, 2)
    }

    func test2014VP() throws {
        let hwp = try openHwp("2014VP")
        XCTAssertEqual(hwp.fileHeader.version.major, 5)
        XCTAssertEqual(hwp.fileHeader.version.minor, 0)
        XCTAssertEqual(hwp.fileHeader.version.build, 5)
        XCTAssertEqual(hwp.fileHeader.version.revision, 0)
    }

    static var allTests = [
        ("test2007", test2007),
        ("test2014VP", test2014VP)
    ]
}
