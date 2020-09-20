import OLEKit

public struct HwpFile {
    let fileHeader: HwpFileHeader
    //let previewText : HKPreviewText
    var directories: [DirectoryEntry] = []

    init(filePath: String, report: (HwpReportable) throws -> Void = { _ in }) throws {
        let ole: OLEFile
        do {
            ole = try OLEFile(filePath)
        } catch {
            throw HwpError.invalidFilePath(path: filePath)
        }

        do {
            guard let fileHeaderStream = ole.root.children.first(where: { $0.name == HwpStreamName.fileHeader.rawValue }) else {
                throw HwpError.streamDoesNotExist(name: HwpStreamName.fileHeader)
            }
            let fileHeaderReader = try ole.stream(fileHeaderStream)
            fileHeader = try HwpFileHeader(fileHeaderReader.readDataToEnd(), report)

        } catch {
            throw HwpError.invalidFilePath(path: filePath)
        }

        //        do {
        //            guard let previewTextStream = ole.root.children.first(where: {$0.name == HKStreamName.PreviewText.rawValue}) else {
        //                throw HKError.StreamDoesNotExist(name: HKStreamName.PreviewText)
        //            }
        //            previewText = HKPreviewText(dataReader: try ole.stream(previewTextStream))
        //        }
    }
}

public enum HwpStreamName: String {
    case fileHeader = "FileHeader"
    case summary = "\005HwpSummaryInformation"
    case previewText = "PrvText"
}
