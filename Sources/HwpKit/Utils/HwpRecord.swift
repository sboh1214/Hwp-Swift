import Foundation

struct HwpRecord {
    var children: [HwpRecord] = []
    let payload: Data
    let tagID: UInt32
    let size: UInt32
    let parentTagID: UInt32
}

func parseRecordTree(data: Data) throws -> HwpRecord {
    let root = HwpRecord(payload: Data(), tagID: 0, size: 0, parentTagID: 0)
    var offset = 0
    while offset<data.count {
        let value = data[offset..<offset+4].uint32
        offset += 4

        let tagId = value & 0x3FF
        let level = (value >> 10) & 0x3FF
        let size = (value >> 20) & 0xFFF
        if size == 0xFFF {
            throw HwpError.bigRecordNotSuppoted(tagId: tagId, level: level)
        }

        var parent = root
        let payload = data[offset..<offset+Int(size)]
        offset += Int(size)

        for _ in 0..<level {
            // parent = parent.children.slice(-1).pop()!
            parent = parent.children.remove(at: 0)
        }
        let child: HwpRecord = HwpRecord(payload: payload, tagID: tagId, size: size, parentTagID: parent.tagID)
        parent.children.append(child)
    }
    return root
}
