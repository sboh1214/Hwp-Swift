let BEGIN: Int = 0x10

final class HwpTag {
    static let DOCUMENT_PROPERTIES = BEGIN
    static let ID_MAPPINGS = BEGIN + 1
    static let BIN_DATA = BEGIN + 2
    static let FACE_NAME = BEGIN + 3
    static let BORDER_FILL = BEGIN + 4
    static let CHAR_SHAPE = BEGIN + 5
    static let TAB_DEF = BEGIN + 6
    static let NUMBERING = BEGIN + 7
    static let BULLET = BEGIN + 8
    static let PARA_SHAPE = BEGIN + 9
    static let STYLE = BEGIN + 10
    static let DOC_DATA = BEGIN + 11
    static let DISTRIBUTE_DOC_DATA = BEGIN + 12
    static let RESERVED = BEGIN + 13
    static let COMPATIBLE_DOCUMENT = BEGIN + 14
    static let LAYOUT_COMPATIBILITY = BEGIN + 15
    static let TRACKCHANGE = BEGIN + 16
    static let MEMO_SHAPE = BEGIN + 76
    static let FORBIDDEN_CHAR = BEGIN + 78
    static let TRACK_CHANGE = BEGIN + 80
    static let TRACK_CHANGE_AUTHOR = BEGIN + 81
}

final class HwpSectionTag {
    static let PARA_HEADER = BEGIN + 50
    static let PARA_TEXT = BEGIN + 51
    static let PARA_CHAR_SHAPE = BEGIN + 52
    static let PARA_LINE_SEG = BEGIN + 53
    static let PARA_RANGE_TAG = BEGIN + 54
    static let CTRL_HEADER = BEGIN + 55
    static let LIST_HEADER = BEGIN + 56
    static let PAGE_DEF = BEGIN + 57
    static let FOOTNOTE_SHAPE = BEGIN + 58
    static let PAGE_BORDER_FILL = BEGIN + 59
    static let SHAPE_COMPONENT = BEGIN + 60
    static let TABLE = BEGIN + 61
    static let SHAPE_COMPONENT_LINE = BEGIN + 62
    static let SHAPE_COMPONENT_RECTANGLE = BEGIN + 63
    static let SHAPE_COMPONENT_ELLIPSE = BEGIN + 64
    static let SHAPE_COMPONENT_ARC = BEGIN + 65
    static let SHAPE_COMPONENT_POLYGON = BEGIN + 66
    static let SHAPE_COMPONENT_CURVE = BEGIN + 67
    static let SHAPE_COMPONENT_OLE = BEGIN + 68
    static let SHAPE_COMPONENT_PICTURE = BEGIN + 69
    static let SHAPE_COMPONENT_CONTAINER = BEGIN + 70
    static let CTRL_DATA = BEGIN + 71
    static let EQEDIT = BEGIN + 72
    static let RESERVED = BEGIN + 73
    static let SHAPE_COMPONENT_TEXTART = BEGIN + 74
    static let FORM_OBJECT = BEGIN + 75
    static let MEMO_SHAPE = BEGIN + 76
    static let MEMO_LIST = BEGIN + 77
    static let CHART_DATA = BEGIN + 79
    static let VIDEO_DATA = BEGIN + 82
    static let SHAPE_COMPONENT_UNKNOWN = BEGIN + 99
}
