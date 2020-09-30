import Foundation
import OLEKit
import DataCompression

struct StreamReader {
    private let ole: OLEFile
    private let streams: [String: DirectoryEntry]

    init(_ ole: OLEFile, _ streams: [String: DirectoryEntry]) {
        self.ole = ole
        self.streams = streams
    }

    func getDataFromStream(_ streamName: HwpStreamName, _ isCompressed: Bool) throws -> Data {
        guard let stream = streams[streamName.rawValue] else {
            throw HwpError.streamDoesNotExist(name: streamName)
        }
        let reader = try ole.stream(stream)
        let data =  reader.readDataToEnd()
        if isCompressed {
            guard let decompressedData = data.decompress(withAlgorithm: .zlib) else {
                throw HwpError.streamDecompressFailed(name: streamName)
            }
            return decompressedData
        } else {
            return data
        }
    }
}
