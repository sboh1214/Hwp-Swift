let BEGIN: UInt32 = 0x10

/**
 ’문서 정보’의 데이터 레코드
 */
final class HwpDocInfoTag {
    static let documentProperties: UInt32 = BEGIN
    static let idMappings: UInt32 = BEGIN + 1
    static let binData: UInt32 = BEGIN + 2
    static let faceName: UInt32 = BEGIN + 3
    static let borderFill: UInt32 = BEGIN + 4
    static let charShape: UInt32 = BEGIN + 5
    static let tabDef: UInt32 = BEGIN + 6
    static let numbering: UInt32 = BEGIN + 7
    static let bullet: UInt32 = BEGIN + 8
    static let paraShape: UInt32 = BEGIN + 9
    static let style: UInt32 = BEGIN + 10
    static let docData: UInt32 = BEGIN + 11
    static let distributeDocData: UInt32 = BEGIN + 12
    static let reserved: UInt32 = BEGIN + 13
    static let compatibleDocument: UInt32 = BEGIN + 14
    static let layoutCompatibility: UInt32 = BEGIN + 15
    static let trackChange: UInt32 = BEGIN + 16
    static let memoShape: UInt32 = BEGIN + 76
    static let forbiddenChar: UInt32 = BEGIN + 78
    static let trackChangeContent: UInt32 = BEGIN + 80
    static let trackChangeAuthor: UInt32 = BEGIN + 81
}

/**
 ‘본문’의 데이터 레코드
 */
final class HwpSectionTag {
    static let paraHeader: UInt32 = BEGIN + 50
    static let paraText: UInt32 = BEGIN + 51
    static let paraCharShape: UInt32 = BEGIN + 52
    static let paraLineSeg: UInt32 = BEGIN + 53
    static let paraRangeTag: UInt32 = BEGIN + 54
    static let ctrlHeader: UInt32 = BEGIN + 55
    static let listHeader: UInt32 = BEGIN + 56
    static let pageDef: UInt32 = BEGIN + 57
    static let footnoteShape: UInt32 = BEGIN + 58
    static let pageBorderFill: UInt32 = BEGIN + 59
    static let shapeComponent: UInt32 = BEGIN + 60
    static let table: UInt32 = BEGIN + 61
    static let shapeComponentLine: UInt32 = BEGIN + 62
    static let shapeComponentRectangle: UInt32 = BEGIN + 63
    static let shapeComponentEllipse: UInt32 = BEGIN + 64
    static let shapeComponentArc: UInt32 = BEGIN + 65
    static let shapeComponentPolygon: UInt32 = BEGIN + 66
    static let shapeComponentCurve: UInt32 = BEGIN + 67
    static let shapeComponentOle: UInt32 = BEGIN + 68
    static let shapeComponentPicture: UInt32 = BEGIN + 69
    static let shapeComponentContainer: UInt32 = BEGIN + 70
    static let ctrlData: UInt32 = BEGIN + 71
    static let eqEdit: UInt32 = BEGIN + 72
    static let reserved: UInt32 = BEGIN + 73
    static let shapeComponentTextart: UInt32 = BEGIN + 74
    static let formObject: UInt32 = BEGIN + 75
    static let memoShape: UInt32 = BEGIN + 76
    static let memoList: UInt32 = BEGIN + 77
    static let chartData: UInt32 = BEGIN + 79
    static let videoData: UInt32 = BEGIN + 82
    static let shapeComponentUnknown: UInt32 = BEGIN + 99
}
