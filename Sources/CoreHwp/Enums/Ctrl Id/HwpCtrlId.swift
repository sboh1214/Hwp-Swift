public enum HwpCtrlId {
    // common
    case table(HwpTable)
    // other
    case column(HwpColumn)
    // field
    // not implemented
    case notImplemented(HwpCtrlHeader)
}

extension HwpCtrlId: HwpPrimitive {
    enum CodingKeys: CodingKey {
        case table
        case column
        case notImplemented
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let key = container.allKeys.first

        switch key {
        case .table:
            let hwpTable = try container.decode(HwpTable.self, forKey: .table)
            self = .table(hwpTable)
        case .column:
            let hwpColumn = try container.decode(HwpColumn.self, forKey: .column)
            self = .column(hwpColumn)
        case .notImplemented:
            let hwpCtrlHeader = try container.decode(HwpCtrlHeader.self, forKey: .notImplemented)
            self = .notImplemented(hwpCtrlHeader)
        case .none:
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
        case .column(let hwpColumn):
            try container.encode(hwpColumn, forKey: .column)
        case .notImplemented(let hwpCtrlHeader):
            try container.encode(hwpCtrlHeader, forKey: .notImplemented)
        }
    }
}
