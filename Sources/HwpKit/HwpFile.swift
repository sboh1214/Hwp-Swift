import OLEKit

public struct HwpFile {
    let fileHeader: HwpFileHeader
    //let previewText : HKPreviewText
    var directories: [DirectoryEntry] = []
    
    var warnings: [HwpWarning] = []
    
    init(filePath: String) throws {
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
            fileHeader = HwpFileHeader(dataReader: try ole.stream(fileHeaderStream))
            
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
    
    func report(report: inout HwpReportable) throws -> Void {
        
    }
}

public enum HwpStreamName: String {
    case fileHeader = "FileHeader"
    case summary = "\005HwpSummaryInformation"
    case previewText = "PrvText"
}
