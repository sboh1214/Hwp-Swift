@testable import HwpKit
import XCTest

final class ContentTests: XCTestCase {
    func openHwp() throws -> HwpFile {
        let url = URL(fileURLWithPath: #file)
            .deletingLastPathComponent()
            .appendingPathComponent("noori.hwp")
        return try HwpFile(filePath: url.path)
    }
    
    func testSection() throws {
        let hwp = try openHwp()
        XCTAssertEqual(hwp.docInfo.documentProperties.sectionSize, 1)
    }

    static var allTests = [
        ("testSection", testSection),
    ]
}
