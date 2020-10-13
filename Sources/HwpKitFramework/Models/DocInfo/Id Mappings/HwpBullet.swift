import Foundation

/**
 글머리표
 
 Tag ID : HWPTAG_BULLET
 
 * TODO 추가 조사 필요 : 문서 외에 남는 바이트 존재
 */
public struct HwpBullet {
    /**문단 머리의 정보 8바이트*/
    public let info: [BYTE]
    /**글머리표 문자*/
    public let char: String
    /**이미지 글머리표 여부 (글머리표 :0, 이미지글머리표 : ID)*/
    public let imageId: Int32
    /**이미지 글머리 (대비, 밝기 ,효과, ID) 4바이트*/
    public let imageProperty: [BYTE]
    /**체크 글머리표 문자*/
    public let checkChar: String
}

extension HwpBullet: HwpFromData {
    init(_ data: Data) throws {
        var reader = DataReader(data)
        defer {
            // precondition(reader.isEOF())
        }
        info = reader.readBytes(8).bytes
        char = [reader.read(WCHAR.self)].string
        imageId = reader.read(Int32.self)
        imageProperty = reader.readBytes(4).bytes
        checkChar = [reader.read(WCHAR.self)].string
    }
}
