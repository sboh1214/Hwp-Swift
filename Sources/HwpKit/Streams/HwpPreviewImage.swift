import Foundation

struct HwpPreviewImage: HwpData {
    let image: Data

    init(_ data: Data) throws {
        image = data
    }
}
