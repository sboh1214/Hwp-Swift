import OLEKit

public struct HwpFile {
    let fileHeader: HwpFileHeader
    let docInfo: HwpDocInfo
    let previewText: HwpPreviewText

    init(filePath: String) throws {
        let ole: OLEFile
        do {
            ole = try OLEFile(filePath)
        } catch {
            throw HwpError.invalidFilePath(path: filePath)
        }

        let streams = Dictionary(uniqueKeysWithValues: ole.root.children.map { ($0.name, $0 ) })

        guard let fileHeaderStream = streams[HwpStreamName.fileHeader.rawValue] else {
            throw HwpError.streamDoesNotExist(name: HwpStreamName.fileHeader)
        }
        let fileHeaderReader = try ole.stream(fileHeaderStream)
        fileHeader = try HwpFileHeader(fileHeaderReader.readDataToEnd())

        guard let docInfoStream = streams[HwpStreamName.docInfo.rawValue] else {
            throw HwpError.streamDoesNotExist(name: HwpStreamName.docInfo)
        }
        let docInfoReader = try ole.stream(docInfoStream)
        docInfo = try HwpDocInfo(docInfoReader.readDataToEnd())

        guard let previewTextStream = streams[HwpStreamName.previewText.rawValue] else {
            throw HwpError.streamDoesNotExist(name: HwpStreamName.previewText)
        }
        let previewTextReader = try ole.stream(previewTextStream)
        previewText = try HwpPreviewText(previewTextReader.readDataToEnd())
    }
}

public enum HwpStreamName: String {
    case fileHeader = "FileHeader"
    case docInfo = "DocInfo"
    case summary = "\005HwpSummaryInformation"
    case previewText = "PrvText"
    case previewImage = "PrvImage"
}
