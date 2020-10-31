public struct HwpTable {
    public var commonCtrlProperty: HwpCommonCtrlProperty
}

extension HwpTable: HwpFromRecord {
    init(_ record: HwpRecord) throws {
        var reader = DataReader(record.payload)

        commonCtrlProperty = try HwpCommonCtrlProperty(&reader)
    }
}
