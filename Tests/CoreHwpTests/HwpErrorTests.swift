import CoreHwp
import XCTest
import Nimble

class HwpErrorTests: XCTestCase {
    func test() throws {
        expect {try openHwp(#file, "")}.to(throwError(HwpError.atOLEKit(description: "")))
    }
}
