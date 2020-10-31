public struct HwpGenShapeObject {
    /**ctrl id*/
    public var commonCtrlProperty: HwpCommonCtrlProperty
}

extension HwpGenShapeObject: HwpFromRecord {
    init(_ record: HwpRecord) throws {
        var reader = DataReader(record.payload)

        commonCtrlProperty = try HwpCommonCtrlProperty(&reader)

        if !reader.isEOF {
            throw HwpError.dataIsNotEOF(remain: reader.remainBytes)
        }
    }
}
