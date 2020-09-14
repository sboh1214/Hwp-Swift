import Foundation
import OLEKit

struct HwpPreviewText {
    let text: String

    init(dataReader: DataReader) {
        text = String(data: dataReader.readDataToEnd(), encoding: .utf8) ?? "Error"
    }
}
