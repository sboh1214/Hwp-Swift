import XCTest
@testable import HwpKitFramework
import SWCompression

final class HwpUtilTests: XCTestCase {
    func testBitsFromInt8() {
        let byte = UInt8(0x4A)
        let bits = [false, true, false, false, true, false, true, false].reversed() as [Bool]
        XCTAssertEqual(bits, byte.bits)
    }

    func testCompressUncompress() throws {
        let testData = "Hello World".data(using: .utf16LittleEndian)!

        let compressed = Deflate.compress(data: testData)
        let decompressed = try Deflate.decompress(data: compressed)

        XCTAssertEqual(testData, decompressed)

    }

}
