import XCTest
@testable import HwpKitFramework
import Z
import DataCompression

final class HwpUtilTests: XCTestCase {
    func testBitsFromInt8() {
        let byte = UInt8(0x4A)
        let bits = [false, true, false, false, true, false, true, false].reversed() as [Bool]
        XCTAssertEqual(bits, byte.bits)
    }

    func testCompressUncompress() throws {
        let testData = "Hello World".data(using: .utf16LittleEndian)!

        let destLen = 2000
        let dest = UnsafeMutableBufferPointer<UInt8>.allocate(capacity: destLen)

        let compressedZ = try testData.withUnsafeBytes { (source) throws -> Data in

            let ptr = UnsafeMutablePointer<UInt>.allocate(capacity: 1)
            defer { ptr.deallocate() }
            ptr.pointee = UInt(dest.count)
            let bound = source.bindMemory(to: UInt8.self)
            compress(dest.baseAddress, ptr, bound.baseAddress, uLong(bound.count))

            return Data(bytes: dest.baseAddress!, count: Int(ptr.pointee))
        }

        let compressedDC = testData.compress(withAlgorithm: .zlib)!

        XCTAssertNotEqual(compressedZ, compressedDC)

        let decompressedZ = try compressedZ.withUnsafeBytes { (source) throws -> Data in

            let ptr = UnsafeMutablePointer<UInt>.allocate(capacity: 1)
            defer { ptr.deallocate() }
            ptr.pointee = UInt(dest.count)
            let bound = source.bindMemory(to: UInt8.self)

            uncompress(dest.baseAddress, ptr, bound.baseAddress, uLong(bound.count))
            return Data(bytes: dest.baseAddress!, count: Int(ptr.pointee))
        }

        XCTAssertEqual(decompressedZ, testData)

    }

}
