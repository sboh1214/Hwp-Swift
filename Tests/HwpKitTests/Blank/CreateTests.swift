import HwpKit
import XCTest

final class CreateTests: XCTestCase {
    func createHwp() throws -> (HwpFile, HwpFile) {
        let url = URL(fileURLWithPath: #file)
            .deletingLastPathComponent()
            .appendingPathComponent("blank.hwp")
        let expected =  try HwpFile(filePath: url.path)
        let actual = HwpFile()
        return (expected, actual)
    }

    func testCreate() throws {
        let (_, _) = try createHwp()
    }
}
