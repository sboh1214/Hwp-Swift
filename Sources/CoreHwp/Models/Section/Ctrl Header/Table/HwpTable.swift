public struct HwpTable {
    public var commonCtrlProperty: HwpCommonCtrlProperty
    public var tableProperty: HwpTableProperty
//    public var listHeaderArray: [HwpListHeader]
//    public var paraHeaderArray: [HwpParaHeader]
}

extension HwpTable: HwpFromRecordWithVersion {
    init(_ record: HwpRecord, _ version: HwpVersion) throws {
        var reader = DataReader(record.payload)

        commonCtrlProperty = try HwpCommonCtrlProperty(&reader)

        let tablePropertyData = record.children.remove(at: 0).payload
        tableProperty = try HwpTableProperty.load(tablePropertyData, version)

//        listHeaderArray = [HwpListHeader]()
//        paraHeaderArray = [HwpParaHeader]()
//        while !record.children.isEmpty {
//            let listHeaderData = record.children.remove(at: 0).payload
//            listHeaderArray.append(try HwpListHeader.load(listHeaderData))
//            let paraHeaderData = record.children.remove(at: 0).payload
//            paraHeaderArray.append(try HwpParaHeader.load(paraHeaderData, version))
//        }
    }
}
