import Foundation

public struct HwpTable: HwpCommonProperty {
    var commonCtrlId: HwpCommonCtrlId

    var property: UInt32

    var verticalOffset: HWPUNIT

    var horizontalOffset: HWPUNIT

    var width: HWPUNIT

    var height: HWPUNIT

    var zOrder: Int32

    var marginArray: [HWPUNIT16]

    var instanceId: UInt32

    var isDividablePage: Bool

    var objectDescription: String

}

extension HwpTable: HwpFromRecord {
    init(_ record: HwpRecord) throws {
        var reader = DataReader(record.payload)
        let ctrlId = reader.read(UInt32.self)
        if let commonCtrlId = HwpCommonCtrlId.init(rawValue: ctrlId) {
            self.commonCtrlId = commonCtrlId
        } else {
            throw HwpError.invalidCtrlId(ctrlId: ctrlId)
        }

        property = reader.read(UInt32.self)
        verticalOffset = reader.read(HWPUNIT.self)
        horizontalOffset = reader.read(HWPUNIT.self)
        width = reader.read(HWPUNIT.self)
        height = reader.read(HWPUNIT.self)
        zOrder = reader.read(Int32.self)
        marginArray = [
            reader.read(HWPUNIT16.self),
            reader.read(HWPUNIT16.self),
            reader.read(HWPUNIT16.self),
            reader.read(HWPUNIT16.self)
        ]
        instanceId = reader.read(UInt32.self)
        isDividablePage = reader.read(Int32.self) == 1 ? true : false
        let objectDescriptionLength = reader.read(WORD.self)
        objectDescription = reader.read(WCHAR.self, objectDescriptionLength).string
    }
}

protocol HwpCommonProperty {
    var commonCtrlId: HwpCommonCtrlId {get set}
    var property: UInt32 {get set}
    var verticalOffset: HWPUNIT {get set}
    var horizontalOffset: HWPUNIT {get set}
    var width: HWPUNIT {get set}
    var height: HWPUNIT {get set}
    var zOrder: Int32 {get set}
    var marginArray: [HWPUNIT16] {get set}
    var instanceId: UInt32 {get set}
    var isDividablePage: Bool {get set}
    var objectDescription: String {get set}
}
