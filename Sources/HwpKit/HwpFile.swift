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
        let test = Test(ole, streams)
        
        fileHeader = try HwpFileHeader(test.getDataFromStream(.fileHeader, false))
        
        docInfo = try HwpDocInfo(test.getDataFromStream(.docInfo, fileHeader.isCompressed))
        
        guard let previewTextStream = streams[HwpStreamName.previewText.rawValue] else {
            throw HwpError.streamDoesNotExist(name: HwpStreamName.previewText)
        }
        let previewTextReader = try ole.stream(previewTextStream)
        previewText = try HwpPreviewText(previewTextReader.readDataToEnd())
    }
    
    
}

fileprivate struct Test {
    private let ole: OLEFile
    private let streams: [String: DirectoryEntry]
    
    init(_ ole: OLEFile, _ streams: [String: DirectoryEntry]) {
        self.ole = ole
        self.streams = streams
    }
    
    fileprivate func getDataFromStream(_ streamName: HwpStreamName, _ isCompressed: Bool) throws -> Data {
        guard let stream = streams[streamName.rawValue] else {
            throw HwpError.streamDoesNotExist(name: streamName)
        }
        let reader = try ole.stream(stream)
        let data =  reader.readDataToEnd()
        if isCompressed {
            if #available(OSX 10.15, *) {
                return try (data as NSData).decompressed(using: .zlib) as Data
            } else {
                guard let decompressedData = data.decompress(withAlgorithm: .zlib) else {
                    throw HwpError.streamDecompressFailed(name: streamName)
                }
                return decompressedData
            }
            
        } else {
            return data
        }
    }
}

public enum HwpStreamName: String {
    case fileHeader = "FileHeader"
    case docInfo = "DocInfo"
    case summary = "\005HwpSummaryInformation"
    case previewText = "PrvText"
    case previewImage = "PrvImage"
}
