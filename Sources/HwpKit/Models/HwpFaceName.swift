import Foundation

public struct HwpFaceName: HwpData {
    let property: BYTE
    let faceNameLength: WORD
    let faceName: [WCHAR]
    var alternativeFaceType: BYTE? = nil
    var alternativeFaceNameLength: WORD? = nil
    var alternativeFaceName: [WCHAR]? = nil
    var faceTypeInfo: [BYTE]? = nil
    var defaultFaceNameLength: WORD? = nil
    var defaultFaceName: [WCHAR]? = nil
    
    init(_ data: Data) throws {
        var reader = DataReader(data)
        
        property = reader.readBYTE()
        let hasAlternative = property.bits[7]
        let hasInfo = property.bits[6]
        let hasDefault = property.bits[5]
        
        faceNameLength = reader.readWord()
        faceName = reader.readWCHAR(Int(faceNameLength))
        
        if hasAlternative {
            alternativeFaceType = reader.readBYTE()
            alternativeFaceNameLength = reader.readWord()
            alternativeFaceName = reader.readWCHAR(Int(alternativeFaceNameLength!))
        }
        if hasInfo {
            faceTypeInfo = reader.readBytes(10).bytes
        }
        if hasDefault {
            defaultFaceNameLength = reader.readWord()
            defaultFaceName = reader.readWCHAR(Int(defaultFaceNameLength!))
        }
    }
}
