import Foundation

public struct HwpFaceName {
    public let property: BYTE
    public let faceNameLength: WORD
    public let faceName: String?
    public var alternativeFaceType: BYTE?
    public var alternativeFaceNameLength: WORD?
    public var alternativeFaceName: String?
    public var faceTypeInfo: [BYTE]?
    public var defaultFaceNameLength: WORD?
    public var defaultFaceName: String?
}

extension HwpFaceName: HwpFromData {
    init() {
        property = 0
        faceNameLength = 0
        faceName = ""
        alternativeFaceType = nil
        alternativeFaceNameLength = nil
        alternativeFaceName = nil
        faceTypeInfo = nil
        defaultFaceNameLength = nil
        defaultFaceName = nil
    }

    init(_ reader: inout DataReader) throws {
        property = reader.read(BYTE.self)
        let hasAlternative = property.bits[7]
        let hasInfo = property.bits[6]
        let hasDefault = property.bits[5]

        faceNameLength = reader.read(WORD.self)
        faceName = reader.read(WCHAR.self, faceNameLength).string

        if hasAlternative {
            alternativeFaceType = reader.read(BYTE.self)
            alternativeFaceNameLength = reader.read(WORD.self)
            alternativeFaceName = reader.read(WCHAR.self, alternativeFaceNameLength!).string
        }
        if hasInfo {
            faceTypeInfo = reader.readBytes(10).bytes
        }
        if hasDefault {
            defaultFaceNameLength = reader.read(WORD.self)
            defaultFaceName = reader.read(WCHAR.self, defaultFaceNameLength!).string
        }
    }
}

extension HwpFaceName {
    init(_ faceName: String, _ faceTypeInfo: [BYTE], _ defaultFaceName: String) {
        property = 97
        faceNameLength = WORD(faceName.count)
        self.faceName = faceName
        alternativeFaceType = nil
        alternativeFaceNameLength = nil
        alternativeFaceName = nil
        self.faceTypeInfo = faceTypeInfo
        defaultFaceNameLength = WORD(defaultFaceName.count)
        self.defaultFaceName = defaultFaceName
    }
}
