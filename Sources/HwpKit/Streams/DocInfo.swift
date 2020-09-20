import Foundation

struct HwpDocInfo: HwpStream {
    let record: HwpRecord
    let numberOfSection: UInt16

    init(_ data: Data, _ report: (HwpReportable) throws -> Void) throws {
        record = try parseRecordTree(data: data)
        var reader = DataReader(record.payload)
        numberOfSection = reader.readUInt16()
    }
}
