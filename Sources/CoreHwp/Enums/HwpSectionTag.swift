let begin: UInt32 = 0x10

/**
 ‘본문’의 데이터 레코드
 */
final class HwpSectionTag {
    static let paraHeader: UInt32 = begin + 50
    static let paraText: UInt32 = begin + 51
    static let paraCharShape: UInt32 = begin + 52
    static let paraLineSeg: UInt32 = begin + 53
    static let paraRangeTag: UInt32 = begin + 54
    static let ctrlHeader: UInt32 = begin + 55
    static let listHeader: UInt32 = begin + 56
    static let pageDef: UInt32 = begin + 57
    static let footnoteShape: UInt32 = begin + 58
    static let pageBorderFill: UInt32 = begin + 59
    static let shapeComponent: UInt32 = begin + 60
    static let table: UInt32 = begin + 61
    static let shapeComponentLine: UInt32 = begin + 62
    static let shapeComponentRectangle: UInt32 = begin + 63
    static let shapeComponentEllipse: UInt32 = begin + 64
    static let shapeComponentArc: UInt32 = begin + 65
    static let shapeComponentPolygon: UInt32 = begin + 66
    static let shapeComponentCurve: UInt32 = begin + 67
    static let shapeComponentOle: UInt32 = begin + 68
    static let shapeComponentPicture: UInt32 = begin + 69
    static let shapeComponentContainer: UInt32 = begin + 70
    static let ctrlData: UInt32 = begin + 71
    static let eqEdit: UInt32 = begin + 72
    static let reserved: UInt32 = begin + 73
    static let shapeComponentTextart: UInt32 = begin + 74
    static let formObject: UInt32 = begin + 75
    static let memoShape: UInt32 = begin + 76
    static let memoList: UInt32 = begin + 77
    static let chartData: UInt32 = begin + 79
    static let videoData: UInt32 = begin + 82
    static let shapeComponentUnknown: UInt32 = begin + 99
}
