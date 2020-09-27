// swiftlint:disable identifier_name

let BEGIN: UInt32 = 0x10

final class HwpDocInfoTag {
    static let DOCUMENT_PROPERTIES: UInt32 = BEGIN
    static let ID_MAPPINGS: UInt32 = BEGIN + 1
    static let BIN_DATA: UInt32 = BEGIN + 2
    static let FACE_NAME: UInt32 = BEGIN + 3
    static let BORDER_FILL: UInt32 = BEGIN + 4
    static let CHAR_SHAPE: UInt32 = BEGIN + 5
    static let TAB_DEF: UInt32 = BEGIN + 6
    static let NUMBERING: UInt32 = BEGIN + 7
    static let BULLET: UInt32 = BEGIN + 8
    static let PARA_SHAPE: UInt32 = BEGIN + 9
    static let STYLE: UInt32 = BEGIN + 10
    static let DOC_DATA: UInt32 = BEGIN + 11
    static let DISTRIBUTE_DOC_DATA: UInt32 = BEGIN + 12
    static let RESERVED: UInt32 = BEGIN + 13
    static let COMPATIBLE_DOCUMENT: UInt32 = BEGIN + 14
    static let LAYOUT_COMPATIBILITY: UInt32 = BEGIN + 15
    static let TRACKCHANGE: UInt32 = BEGIN + 16
    static let MEMO_SHAPE: UInt32 = BEGIN + 76
    static let FORBIDDEN_CHAR: UInt32 = BEGIN + 78
    static let TRACK_CHANGE: UInt32 = BEGIN + 80
    static let TRACK_CHANGE_AUTHOR: UInt32 = BEGIN + 81
}

final class HwpSectionTag {
    static let PARA_HEADER: UInt32 = BEGIN + 50
    static let PARA_TEXT: UInt32 = BEGIN + 51
    static let PARA_CHAR_SHAPE: UInt32 = BEGIN + 52
    static let PARA_LINE_SEG: UInt32 = BEGIN + 53
    static let PARA_RANGE_TAG: UInt32 = BEGIN + 54
    static let CTRL_HEADER: UInt32 = BEGIN + 55
    static let LIST_HEADER: UInt32 = BEGIN + 56
    static let PAGE_DEF: UInt32 = BEGIN + 57
    static let FOOTNOTE_SHAPE: UInt32 = BEGIN + 58
    static let PAGE_BORDER_FILL: UInt32 = BEGIN + 59
    static let SHAPE_COMPONENT: UInt32 = BEGIN + 60
    static let TABLE: UInt32 = BEGIN + 61
    static let SHAPE_COMPONENT_LINE: UInt32 = BEGIN + 62
    static let SHAPE_COMPONENT_RECTANGLE: UInt32 = BEGIN + 63
    static let SHAPE_COMPONENT_ELLIPSE: UInt32 = BEGIN + 64
    static let SHAPE_COMPONENT_ARC: UInt32 = BEGIN + 65
    static let SHAPE_COMPONENT_POLYGON: UInt32 = BEGIN + 66
    static let SHAPE_COMPONENT_CURVE: UInt32 = BEGIN + 67
    static let SHAPE_COMPONENT_OLE: UInt32 = BEGIN + 68
    static let SHAPE_COMPONENT_PICTURE: UInt32 = BEGIN + 69
    static let SHAPE_COMPONENT_CONTAINER: UInt32 = BEGIN + 70
    static let CTRL_DATA: UInt32 = BEGIN + 71
    static let EQEDIT: UInt32 = BEGIN + 72
    static let RESERVED: UInt32 = BEGIN + 73
    static let SHAPE_COMPONENT_TEXTART: UInt32 = BEGIN + 74
    static let FORM_OBJECT: UInt32 = BEGIN + 75
    static let MEMO_SHAPE: UInt32 = BEGIN + 76
    static let MEMO_LIST: UInt32 = BEGIN + 77
    static let CHART_DATA: UInt32 = BEGIN + 79
    static let VIDEO_DATA: UInt32 = BEGIN + 82
    static let SHAPE_COMPONENT_UNKNOWN: UInt32 = BEGIN + 99
}
