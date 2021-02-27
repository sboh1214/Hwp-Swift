public struct HwpColumnProperty {
    public var type: HwpColumnType
    public var count: Int
    public var direction: HwpColumnDirection
    public var isSameWidth: Bool
}

extension HwpColumnProperty: HwpFromUInt {
    typealias UIntType = UInt16

    init(_ reader: inout BitsReader<UInt16>) throws {
        let typeRawValue = reader.readInt(2)
        guard let type = HwpColumnType(rawValue: typeRawValue) else {
            throw HwpError.invalidRawValueForEnum(model: HwpColumnType.self, rawValue: typeRawValue)
        }
        self.type = type

        count = reader.readInt(8)

        let directionRawValue = reader.readInt(2)
        guard let direction = HwpColumnDirection(rawValue: directionRawValue) else {
            throw HwpError.invalidRawValueForEnum(model: HwpColumnDirection.self, rawValue: directionRawValue)
        }
        self.direction = direction

        isSameWidth = reader.readBit()

        reader.readBits(3)
    }
}

extension HwpColumnProperty {
    init() {
        type = .general
        count = 1
        direction = .left
        isSameWidth = true
    }
}

public enum HwpColumnType: Int, HwpPrimitive {
    /** 일반 다단 */
    case general = 0
    /** 배분 다단 */
    case div = 1
    /** 평행 다단 */
    case along = 2
}

public enum HwpColumnDirection: Int, HwpPrimitive {
    /** 왼쪽부터 */
    case left = 0
    /** 오른쪽부터 */
    case right = 1
    /** 맞쪽 */
    case yang = 2
}
