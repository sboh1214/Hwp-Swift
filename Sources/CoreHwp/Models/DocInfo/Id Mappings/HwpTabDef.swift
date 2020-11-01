import Foundation

/**
 탭 정의
 
 Tag ID : HWPTAG_TAB_DEF
 */
public struct HwpTabDef {
    /**속성*/
    public let property: UInt32
    /**count*/
    public let count: Int32
    public var tabInfoArray: [HwpTabInfo]
}

extension HwpTabDef {
    init(property: UInt32) {
        self.property = property
        self.count = 0
        self.tabInfoArray = [HwpTabInfo]()
    }
}

extension HwpTabDef: HwpFromData {
    init(_ reader: inout DataReader) throws {
        property = reader.read(UInt32.self)
        count = reader.read(Int32.self)
        tabInfoArray = [HwpTabInfo]()
        for _ in 0..<count {
            tabInfoArray.append(try HwpTabInfo.load(reader.readBytes(8)))
        }
    }
}
