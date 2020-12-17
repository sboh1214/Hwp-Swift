extension Character: Codable {
    public init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()
        let string = try container.decode(String.self)
        guard !string.isEmpty else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Decoder expected a Character but found an empty string."
            )
        }
        guard string.count == 1 else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Decoder expected a Character but found a string: \(string)"
            )
        }
        self = string[string.startIndex]
    }
    public func encode(to encoder: Encoder) throws {
        var container = encoder.unkeyedContainer()
        try container.encode(String(self))
    }
}
