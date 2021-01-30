import CoreHwp
import Nimble
import XCTest

class HwpErrorTests: XCTestCase {
    func test() throws {
        expect { try openHwp(#file, "") }.to(throwError())
    }
}
