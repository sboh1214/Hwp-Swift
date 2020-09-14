import OLEKit

public struct HwpFile {
    let ole:OLEFile
    let fileHeader : HwpFileHeader
//    let previewText : HKPreviewText
    
    init(filePath:String) throws {
        do {
            ole = try OLEFile(filePath)
        }
        catch {
            throw HwpError.InvalidFilePath(path: filePath)
        }
        
        do {
            guard let fileHeaderStream = ole.root.children.first(where: { $0.name == HKStreamName.FileHeader.rawValue }) else {
                throw HwpError.StreamDoesNotExist(name: HKStreamName.FileHeader)
            }
            fileHeader = HwpFileHeader(dataReader: try ole.stream(fileHeaderStream))
        }
        catch {
            throw HwpError.InvalidFilePath(path: filePath)
        }
        
//        do {
//            guard let previewTextStream = ole.root.children.first(where: {$0.name == HKStreamName.PreviewText.rawValue}) else {
//                throw HKError.StreamDoesNotExist(name: HKStreamName.PreviewText)
//            }
//            previewText = HKPreviewText(dataReader: try ole.stream(previewTextStream))
//        }
    }
}

public enum HKStreamName:String {
    case FileHeader = "FileHeader"
    case Summary = "\005HwpSummaryInformation"
    case PreviewText = "PrvText"
}
