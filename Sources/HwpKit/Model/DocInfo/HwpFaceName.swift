import Foundation

public struct HwpFaceName: HwpData {
    public let property: BYTE
    public let faceNameLength: WORD
    public let faceName: [WCHAR]
    public var alternativeFaceType: BYTE?
    public var alternativeFaceNameLength: WORD?
    public var alternativeFaceName: [WCHAR]?
    public var faceTypeInfo: [BYTE]?
    public var defaultFaceNameLength: WORD?
    public var defaultFaceName: [WCHAR]?

    init(_ data: Data) throws {
        var reader = DataReader(data)

        property = reader.read(BYTE.self)
        let hasAlternative = property.bits[7]
        let hasInfo = property.bits[6]
        let hasDefault = property.bits[5]

        faceNameLength = reader.read(WORD.self)
        faceName = reader.read(WCHAR.self, Int(faceNameLength))

        if hasAlternative {
            alternativeFaceType = reader.read(BYTE.self)
            alternativeFaceNameLength = reader.read(WORD.self)
            alternativeFaceName = reader.read(WCHAR.self, Int(alternativeFaceNameLength!))
        }
        if hasInfo {
            faceTypeInfo = reader.readBytes(10).bytes
        }
        if hasDefault {
            defaultFaceNameLength = reader.read(WORD.self)
            defaultFaceName = reader.read(WCHAR.self, Int(defaultFaceNameLength!))
        }
    }
}
