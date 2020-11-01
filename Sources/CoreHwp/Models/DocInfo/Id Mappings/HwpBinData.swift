import Foundation

/**
 그림, OLE 등의 바이너리 데이터 아이템에 대한 정보
 
 Tag ID : HWPTAG_BIN_DATA
 */
public struct HwpBinData: HwpFromData {
    /**속성 -> type*/
    public let type: HwpBinDataType

    // TODO 속성 파싱

    /**Type이 "LINK"일 때, 연결 파일의 절대 경로 길이*/
    var absolutePathLength: WORD?
    /**Type이 "LINK"일 때, 연결 파일의 절대 경로*/
    public var absolutePath: [WCHAR]?
    /**Type이 "LINK"일 때, 연결 파일의 상대 경로 길이*/
    var relativePathLength: WORD?
    /**Type이 "LINK"일 때, 연결 파일의 상대 경로*/
    public var relativePath: [WCHAR]?

    /**Type이 "EMBEDDING"이거나 "STORAGE"일 때, BINDATASTORAGE에 저장된 바이너리 데이터의 아이디*/
    public var streamId: UInt16?
    /**Type이 "EMBEDDING"일 때, 바이너리 데이터의 형식 이름의 길이*/
    public var extensionLength: WORD?
    /**
     Type이 "EMBEDDING"일 때 extension("." 제외)
     
     그림의 경우 jpg, bmp, gif
     OLE의 경우 ole
     */
    public var extensionName: [WCHAR]?

    init() {
        type = .embedding
        absolutePathLength = nil
        absolutePath = nil
        relativePathLength = nil
        relativePath = nil
        streamId = nil
        extensionLength = nil
        extensionName = nil
    }

    init(_ reader: inout DataReader) throws {
        let property = reader.read(UInt16.self)
        type = HwpBinDataType(rawValue: getBitValue(Int(property), 0, 3))!

        if type == HwpBinDataType.link {
            absolutePathLength = reader.read(WORD.self)
            absolutePath = reader.read(WCHAR.self, absolutePathLength!)
            relativePathLength = reader.read(WORD.self)
            relativePath = reader.read(WCHAR.self, relativePathLength!)
        } else {
            streamId = reader.read(UInt16.self)
            extensionLength = reader.read(WORD.self)
            extensionName = reader.read(WCHAR.self, extensionLength!)
        }
    }
}

public enum HwpBinDataType: Int, Codable {
    case link = 0x0
    case embedding = 0x1
    case storage = 0x2
}
