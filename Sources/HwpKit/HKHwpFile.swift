import OLEKit

public struct HKHwpFile {
    let ole:OLEFile
    let fileHeader : HKFileHeader
//    let previewText : HKPreviewText
    
    init(filePath:String) throws {
        do {
            ole = try OLEFile(filePath)
        }
        catch {
            throw HKError.InvalidFilePath(path: filePath)
        }
        
        do {
            guard let fileHeaderStream = ole.root.children.first(where: { $0.name == HKStreamName.FileHeader.rawValue }) else {
                throw HKError.StreamDoesNotExist(name: HKStreamName.FileHeader)
            }
            fileHeader = HKFileHeader(dataReader: try ole.stream(fileHeaderStream))
        }
        catch {
            throw HKError.InvalidFilePath(path: filePath)
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
