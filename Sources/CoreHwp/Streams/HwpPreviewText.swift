import Foundation

/**
 미리보기 텍스트
 
 PrvText 스트림에는 미리보기 텍스트가 유니코드 문자열로 저장된다.
 */
public struct HwpPreviewText: HwpFromData {
    public let text: String

    init() {
        text = "\r\n"
    }

    init(_ reader: inout DataReader) throws {
        guard let text = String(data: reader.readToEnd(), encoding: .utf16LittleEndian) else {
            throw HwpError.invalidDataForString(data: reader.readToEnd(), name: "PreviewText")
        }
        self.text = text
    }
}
