import XCTest
import Nimble

final class CharShapeTests: XCTestCase {

    func testCharShape() throws {
        let hwp = try openHwp(#file, "CharShape")
        let array = hwp.docInfo.idMappings.charShapeArray
        expect(array[0].faceId) == [0, 0, 0, 0, 0, 0, 0]
    }
}
