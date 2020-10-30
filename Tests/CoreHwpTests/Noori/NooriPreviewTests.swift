import CoreHwp
import XCTest

final class NooriPreviewTests: XCTestCase {
    let hwp = openHwp(#file, "noori")

    func testPreviewText() throws {
        let text = "<보도일시><2018. 9. 4.(화) 조간(온라인 9. 3. 12:00)부터 보도해 주시기 바랍니다.  >"
        XCTAssertEqual(hwp.previewText.text.count, 1009)
        XCTAssertEqual(String(Array(hwp.previewText.text)[1...60]), text)
    }
}
