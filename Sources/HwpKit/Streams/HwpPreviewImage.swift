import Foundation

struct HwpPreviewImage: HwpStream {
    let image: Data

    init(_ data: Data, _ report: (HwpReportable) throws -> Void) throws {
        image = data
    }
}
