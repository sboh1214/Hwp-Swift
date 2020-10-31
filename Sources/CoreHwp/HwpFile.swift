import Foundation
import OLEKit

public struct HwpFile: HwpPrimitive {
    public let fileHeader: HwpFileHeader
    public let docInfo: HwpDocInfo
    public let sectionArray: [HwpSection]
    public let previewText: HwpPreviewText

    public init() {
        fileHeader = HwpFileHeader()
        docInfo = HwpDocInfo()
        sectionArray = [HwpSection()]
        previewText = HwpPreviewText()
    }

    public init(filePath: String) throws {
        let ole: OLEFile
        do {
            ole = try OLEFile(filePath)
        } catch {
            throw HwpError.invalidFilePath(path: filePath)
        }
        let streams = Dictionary(uniqueKeysWithValues: ole.root.children.map { ($0.name, $0 ) })
        let reader = StreamReader(ole, streams)

        let fileHeader = try HwpFileHeader(reader.getDataFromStream(.fileHeader, false))
        self.fileHeader = fileHeader

        let docInfoData = try reader.getDataFromStream(.docInfo, fileHeader.isCompressed)
        docInfo = try HwpDocInfo(docInfoData, fileHeader.version)

        sectionArray = try reader.getDataFromStorage(.bodyText, fileHeader.isCompressed)
            .map {try HwpSection($0, fileHeader.version)}

        guard let previewTextStream = streams[HwpStreamName.previewText.rawValue] else {
            throw HwpError.streamDoesNotExist(name: HwpStreamName.previewText)
        }
        let previewTextReader = try ole.stream(previewTextStream)
        previewText = try HwpPreviewText(previewTextReader.readDataToEnd())
    }

}