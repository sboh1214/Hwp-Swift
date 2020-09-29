import Foundation

/**
 그림, OLE 등의 바이너리 데이터 아이템에 대한 정보
 
 Tag ID : HWPTAG_BIN_DATA
 */
public struct HwpBinData: HwpData {
    /**속성*/
    public let property: UInt16
    /**Type이 "LINK"일 때, 연결 파일의 절대 경로 길이*/
    let absolutePathLength: WORD
    /**Type이 "LINK"일 때, 연결 파일의 절대 경로*/
    public let absolutePath: [WCHAR]
    /**Type이 "LINK"일 때, 연결 파일의 상대 경로 길이*/
    let relativePathLength: WORD
    /**Type이 "LINK"일 때, 연결 파일의 상대 경로*/
    public let relativePath: [WCHAR]
    /**Type이 "EMBEDDING"이거나 "STORAGE"일 때, BINDATASTORAGE에 저장된 바이너리 데이터의 아이디*/
    public let streamId: UInt16
    /**Type이 "EMBEDDING"일 때, 바이너리 데이터의 형식 이름의 길이*/
    public let extensionLength: WORD
    /**
     Type이 "EMBEDDING"일 때 extension("." 제외)
     
     그림의 경우 jpg, bmp, gif
     OLE의 경우 ole
     */
    public let extensionName: [WCHAR]

    init(_ data: Data) throws {
        var reader = DataReader(data)
        property = reader.readUInt16()
        absolutePathLength = reader.readWord()
        absolutePath = reader.readWCHAR(Int(absolutePathLength))
        relativePathLength = reader.readWord()
        relativePath = reader.readWCHAR(Int(relativePathLength))
        streamId = reader.readUInt16()
        extensionLength = reader.readWord()
        extensionName = reader.readWCHAR(Int(extensionLength))
    }
}
