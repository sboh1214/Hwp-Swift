let begin: UInt32 = 0x10

/**
 ’문서 정보’의 데이터 레코드
 */
final class HwpDocInfoTag {
    static let documentProperties: UInt32 = begin
    static let idMappings: UInt32 = begin + 1
    static let binData: UInt32 = begin + 2
    static let faceName: UInt32 = begin + 3
    static let borderFill: UInt32 = begin + 4
    static let charShape: UInt32 = begin + 5
    static let tabDef: UInt32 = begin + 6
    static let numbering: UInt32 = begin + 7
    static let bullet: UInt32 = begin + 8
    static let paraShape: UInt32 = begin + 9
    static let style: UInt32 = begin + 10
    static let docData: UInt32 = begin + 11
    static let distributeDocData: UInt32 = begin + 12
    static let reserved: UInt32 = begin + 13
    static let compatibleDocument: UInt32 = begin + 14
    static let layoutCompatibility: UInt32 = begin + 15
    static let trackChange: UInt32 = begin + 16
    static let memoShape: UInt32 = begin + 76
    static let forbiddenChar: UInt32 = begin + 78
    static let trackChangeContent: UInt32 = begin + 80
    static let trackChangeAuthor: UInt32 = begin + 81
}

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

fileprivate func makeCtrlId(_ string: String) -> UInt32 {
    precondition(string.count == 4)
    let array = string.asciiValues.map{UInt32($0)}
    return array[0] << 24 + array[1] << 16 + array[2] << 8 + array[3]
}

final class HwpCtrlId {
    static let table = makeCtrlId("tbl ")
    static let line = makeCtrlId("$lin")
    static let rectangle = makeCtrlId("$lec")
    static let ellipse = makeCtrlId("$ell")
    static let arc = makeCtrlId("$arc")
}
