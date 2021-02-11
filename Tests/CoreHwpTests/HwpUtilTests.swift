import Nimble
import XCTest

@testable import CoreHwp
import SWCompression

final class HwpUtilTests: XCTestCase {
    func testBitsFromInt8() {
        let byte = UInt8(0x4A)
        let bits = [false, true, false, false, true, false, true, false].reversed() as [Bool]
        expect(bits) == byte.bits
    }

    func testUInt32ToBits() {
        let uint32 = UInt32(1)
        let bits = [true] + Array(repeating: false, count: 31)
        expect(uint32.bits) == bits
    }

    func testGetBitValue() {
        expect(2) == getBitValue(mask: 1024, start: 9, end: 10)
        expect(4) == getBitValue(mask: 1024, start: 8, end: 10)
    }

    func testCompressUncompress() throws {
        let testData = "Hello World".data(using: .utf16LittleEndian)!

        let compressed = Deflate.compress(data: testData)
        let decompressed = try Deflate.decompress(data: compressed)

        expect(testData) == decompressed
    }

    #if os(iOS) || os(watchOS) || os(tvOS) || os(macOS)
        func testColorExtension() throws {
            let black = HwpColor()
            expect(black.cgColor) != CGColor.black
            expect(CGColor.black) == CGColor(genericGrayGamma2_2Gray: 0, alpha: 1)
            expect(black.cgColor) != CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 1)
        }
    #endif
}
