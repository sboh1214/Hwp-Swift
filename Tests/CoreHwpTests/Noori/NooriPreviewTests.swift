import Nimble
import XCTest

final class NooriPreviewTests: XCTestCase {
    func testPreviewText() throws {
        let hwp = try openHwp(#file, "noori")

        let text = "<보도일시><2018. 9. 4.(화) 조간(온라인 9. 3. 12:00)부터 보도해 주시기 바랍니다.  >"
        expect(hwp.previewText.text.count) == 1009
        expect(String(Array(hwp.previewText.text)[1 ... 60])) == text
    }
}
