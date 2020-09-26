import Foundation

struct HwpPreviewText: HwpData {
    let text: String

    init(_ data: Data, _: (HwpReportable) -> Void) throws {
        guard let text = String(data: data, encoding: .utf16LittleEndian) else {
            throw HwpError.invalidDataForString(data: data, name: "PreviewText")
        }
        self.text = text
    }
}
