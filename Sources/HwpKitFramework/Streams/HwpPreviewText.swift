import Foundation

/**
 미리보기 텍스트
 
 PrvText 스트림에는 미리보기 텍스트가 유니코드 문자열로 저장된다.
 */
public struct HwpPreviewText: HwpFromData {
    let text: String

    init() {
        text = ""
    }

    init(_ data: Data) throws {
        guard let text = String(data: data, encoding: .utf16LittleEndian) else {
            throw HwpError.invalidDataForString(data: data, name: "PreviewText")
        }
        self.text = text
    }
}
