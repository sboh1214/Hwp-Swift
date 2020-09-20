import Foundation

struct HwpPreviewText: HwpStream {
    let text: String

    init(_ data: Data, _ report: (HwpReportable) throws -> Void) throws {
        guard let text = String(data: data, encoding: .utf16LittleEndian) else {
            throw HwpError.invalidDataForString(data: data, name: "PreviewText")
        }
        self.text = text
    }
}
