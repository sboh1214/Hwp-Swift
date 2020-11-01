public struct HwpTable {
    public var commonCtrlProperty: HwpCommonCtrlProperty
}

extension HwpTable: HwpFromRecord {
    init(_ record: HwpRecord) throws {
        var reader = DataReader(record.payload)
        print(record.children.map { $0.tagId})

        commonCtrlProperty = try HwpCommonCtrlProperty(&reader)

        if !reader.isEOF {
            throw HwpError.dataIsNotEOF(model: self, remain: reader.remainBytes)
        }
    }
}
