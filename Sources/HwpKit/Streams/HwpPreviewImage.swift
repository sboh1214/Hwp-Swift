import Foundation

struct HwpPreviewImage: HwpStream {
    let image: Data

    init(_ data: Data, _: (HwpReportable) -> Void) throws {
        image = data
    }
}
