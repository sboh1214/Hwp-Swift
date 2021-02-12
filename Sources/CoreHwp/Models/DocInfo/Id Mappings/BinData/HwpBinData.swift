import Foundation

/**
 그림, OLE 등의 바이너리 데이터 아이템에 대한 정보

 Tag ID : HWPTAG_BIN_DATA
 */
public struct HwpBinData: HwpFromData {
    public var property: HwpBinDataProperty

    /** Type이 "LINK"일 때, 연결 파일의 절대 경로 */
    public var absolutePath: [WCHAR]?
    /** Type이 "LINK"일 때, 연결 파일의 상대 경로 */
    public var relativePath: [WCHAR]?

    /** Type이 "EMBEDDING"이거나 "STORAGE"일 때, BINDATASTORAGE에 저장된 바이너리 데이터의 아이디 */
    public var streamId: UInt16?
    /**
     Type이 "EMBEDDING"일 때 extension("." 제외)

     그림의 경우 jpg, bmp, gif
     OLE의 경우 ole
     */
    public var extensionName: [WCHAR]?

    init() {
        property = HwpBinDataProperty()
        absolutePath = nil
        relativePath = nil
        streamId = nil
        extensionName = nil
    }

    init(_ reader: inout DataReader) throws {
        property = try HwpBinDataProperty.load(reader.read(UInt16.self))

        if property.type == .link {
            let absolutePathLength = reader.read(WORD.self)
            absolutePath = reader.read(WCHAR.self, absolutePathLength)
            let relativePathLength = reader.read(WORD.self)
            relativePath = reader.read(WCHAR.self, relativePathLength)
        } else {
            streamId = reader.read(UInt16.self)
            let extensionLength = reader.read(WORD.self)
            extensionName = reader.read(WCHAR.self, extensionLength)
        }
    }
}
