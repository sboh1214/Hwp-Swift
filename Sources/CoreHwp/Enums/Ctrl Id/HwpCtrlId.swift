public enum HwpCtrlId {
    case table(HwpTable)
    case other(HwpCtrlHeader)
}

extension HwpCtrlId: HwpPrimitive {
    enum CodingKeys: CodingKey {
        case table, other
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let key = container.allKeys.first

        switch key {
        case .table:
            let hwpTable = try container.decode(
                HwpTable.self,
                forKey: .table
            )
            self = .table(hwpTable)
        case .other:
            let hwpCtrlHeader = try container.decode(
                HwpCtrlHeader.self,
                forKey: .other
            )
            self = .other(hwpCtrlHeader)
        default:
            throw DecodingError.dataCorrupted(
                DecodingError.Context(
                    codingPath: container.codingPath,
                    debugDescription: "Unabled to decode enum."
                )
            )
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        switch self {
        case .table(let hwpTable):
            try container.encode(hwpTable, forKey: .table)
        case .other(let hwpCtrlHeader):
            try container.encode(hwpCtrlHeader, forKey: .other)
        }
    }
}
