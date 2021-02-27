import CoreHwp
import Nimble
import XCTest

final class ColumnTests: XCTestCase {
    func testColumn() throws {
        let hwp = try openHwp(#file, "Column")
        guard let ctrlArray = hwp.sectionArray[0].paragraph[0].ctrlHeaderArray else {
            XCTFail()
            return
        }
        let columnArray: [HwpColumn] = ctrlArray.compactMap {
            switch $0 {
            case let .column(hwpColumn):
                return hwpColumn
            default:
                return nil
            }
        }

        print(columnArray)
    }
}
