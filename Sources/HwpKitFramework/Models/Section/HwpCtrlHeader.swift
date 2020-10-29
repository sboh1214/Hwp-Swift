import Foundation

public struct HwpCtrlHeader {
    public var ctrlId: UInt32
}

extension HwpCtrlHeader: HwpFromRecord {
    init(_ record: HwpRecord) throws {
        var reader = DataReader(record.payload)
        ctrlId = reader.read(UInt32.self)
        //print(HwpCommonCtrlId.init(rawValue: ctrlId))
        //print(record.children.map{$0.tagId})
        //record.children.forEach {precondition($0.children == [HwpRecord]())}
    }
}
