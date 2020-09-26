import Foundation

struct HwpPreviewImage: HwpData {
    let image: Data

    init(_ data: Data, _: (HwpReportable) -> Void) throws {
        image = data
    }
}
