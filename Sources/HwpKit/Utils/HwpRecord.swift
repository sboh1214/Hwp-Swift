import Foundation

struct HwpRecord {
    let children: [HwpRecord] = []
    let payload: [BYTE]
    let tagID: Int
    let size: Int
    let parentTagID: Int
}
