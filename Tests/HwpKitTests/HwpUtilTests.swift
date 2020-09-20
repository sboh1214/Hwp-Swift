import XCTest
@testable import HwpKit

final class HwpUtilTests: XCTestCase {
    func testBitsFromInt8() {
        let byte = UInt8(0x4A)
        let bits = [false, true, false, false, true, false, true, false].reversed() as [Bool]
        XCTAssertEqual(bits, byte.toBits())
    }

    static var allTests = [
        ("testBitsFromInt8", testBitsFromInt8)
    ]
}
