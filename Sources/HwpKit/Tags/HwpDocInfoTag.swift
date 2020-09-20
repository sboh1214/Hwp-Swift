final class HwpDocInfoTag {
    static let BEGIN: Int = 0x10
    
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
