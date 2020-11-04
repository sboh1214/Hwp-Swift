/**
 개체 공통 속성
 */
public struct HwpCommonCtrlProperty: HwpPrimitive {
    /**ctrl ID*/
    public var commonCtrlId: HwpCommonCtrlId
    /**속성*/
    public var property: UInt32
    /**세로 오프셋 값*/
    public var verticalOffset: HWPUNIT
    /**가로 오프셋 값*/
    public var horizontalOffset: HWPUNIT
    /**width 오브젝트의 폭*/
    public var width: HWPUNIT
    /**height 오브젝트의 높이*/
    public var height: HWPUNIT
    /**z-order*/
    public var zOrder: Int32
    /**오브젝트의 바깥 4방향 여백*/
    public var marginArray: [HWPUNIT16]
    /**문서 내 각 개체에 대한 고유 아이디(instance ID)*/
    public var instanceId: UInt32
    /**쪽나눔 방지 on(1) / off(0)*/
    public var isDividablePage: Bool
    /**개체 설명문 글자*/
    public var objectDescription: String

    init(_ reader: inout DataReader) throws {
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
