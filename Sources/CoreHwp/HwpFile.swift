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

    public init(fromPath filePath: String) throws {
        do {
            let ole = try OLEFile(filePath)
            try self.init(fromOLE: ole)
        } catch {
            throw HwpError.invalidFile(path: filePath)
        }
    }

    public init(fromWrapper fileWrapper: FileWrapper) throws {
        do {
            let ole = try OLEFile(fileWrapper)
            try self.init(fromOLE: ole)
        } catch {
            throw HwpError.invalidFile(path: fileWrapper.filename ?? "")
        }
    }

    private init(fromOLE ole: OLEFile) throws {
        let streams = Dictionary(uniqueKeysWithValues: ole.root.children.map { ($0.name, $0 ) })
        let reader = StreamReader(ole, streams)

        let fileHeader = try HwpFileHeader.load(reader.getDataFromStream(.fileHeader, false))
        self.fileHeader = fileHeader

        let isCompressed = fileHeader.fileProperty.isCompressed

        let docInfoData = try reader.getDataFromStream(.docInfo, isCompressed)
        docInfo = try HwpDocInfo.load(docInfoData, fileHeader.version)

        sectionArray = try reader.getDataFromStorage(.bodyText, isCompressed)
            .map {try HwpSection.load($0, fileHeader.version)}

        guard let previewTextStream = streams[HwpStreamName.previewText.rawValue] else {
            throw HwpError.streamDoesNotExist(name: HwpStreamName.previewText)
        }
        let previewTextReader = try ole.stream(previewTextStream)
        previewText = try HwpPreviewText.load(previewTextReader.readDataToEnd())
    }
}
