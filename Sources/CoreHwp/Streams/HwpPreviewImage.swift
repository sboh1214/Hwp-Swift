import Foundation

/**
 미리보기 이미지
 
 PrvImage 스트림에는 미리보기 이미지가 BMP 또는 GIF 형식으로 저장된다.
 */
struct HwpPreviewImage: HwpFromData {
    let image: Data

    init() {
        image = Data()
    }

    init(_ reader: inout DataReader) throws {
        image = reader.readToEnd()
    }
}
