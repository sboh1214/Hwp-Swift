import Foundation
import OLEKit
import DataCompression

public class HwpFile {
    public let fileHeader: HwpFileHeader
    public let docInfo: HwpDocInfo
    public let previewText: HwpPreviewText

    public init(filePath: String) throws {
        let ole: OLEFile
        do {
            ole = try OLEFile(filePath)
        } catch {
            throw HwpError.invalidFilePath(path: filePath)
        }
        let streams = Dictionary(uniqueKeysWithValues: ole.root.children.map { ($0.name, $0 ) })
        let reader = StreamReader(ole, streams)

        fileHeader = try HwpFileHeader(reader.getDataFromStream(.fileHeader, false))

        docInfo = try HwpDocInfo(reader.getDataFromStream(.docInfo, fileHeader.isCompressed))

        guard let previewTextStream = streams[HwpStreamName.previewText.rawValue] else {
            throw HwpError.streamDoesNotExist(name: HwpStreamName.previewText)
        }
        let previewTextReader = try ole.stream(previewTextStream)
        previewText = try HwpPreviewText(previewTextReader.readDataToEnd())
    }

}
