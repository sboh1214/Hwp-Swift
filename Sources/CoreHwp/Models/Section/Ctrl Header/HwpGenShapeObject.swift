public struct HwpGenShapeObject {
    /**ctrl id*/
    public var commonCtrlProperty: HwpCommonCtrlProperty
}

extension HwpGenShapeObject: HwpFromRecord {
    init(_ reader: inout DataReader, _ children: [HwpRecord]) throws {
        commonCtrlProperty = try HwpCommonCtrlProperty(&reader)
    }
}
