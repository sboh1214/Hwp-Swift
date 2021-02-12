import Nimble
import XCTest

final class BinDataTests: XCTestCase {
    func testBinData() throws {
        let hwp = try openHwp(#file, "BinData")
        let binDataArray = hwp.docInfo.idMappings.binDataArray

        expect(binDataArray[0].extensionName) == "png"
        expect(binDataArray[1].extensionName) == "jpeg"
        expect(binDataArray[2].extensionName) == "gif"

        expect(binDataArray[0].streamId) == 1
        expect(binDataArray[1].streamId) == 2
        expect(binDataArray[2].streamId) == 3
    }

    func testBinDataProperty() throws {
        let hwp = try openHwp(#file, "BinData")
        let binDataArray = hwp.docInfo.idMappings.binDataArray

        expect(binDataArray[0].property.type) == .embedding
        expect(binDataArray[0].property.compressType) == .never
        expect(binDataArray[0].property.state) == .never
    }
}
