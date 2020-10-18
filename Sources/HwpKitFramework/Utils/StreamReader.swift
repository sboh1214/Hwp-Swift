import Foundation
import OLEKit
import DataCompression
import Z

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
        return try readData(stream, isCompressed)
    }

    func getDataFromStorage(_ streamName: HwpStreamName, _ isCompressed: Bool) throws -> [Data] {
        guard let storage = streams[streamName.rawValue] else {
            throw HwpError.streamDoesNotExist(name: streamName)
        }
        return try storage.children.map { try readData($0, isCompressed) }
    }

    private func readData(_ stream: DirectoryEntry, _ isCompressed: Bool) throws -> Data {
        let reader = try ole.stream(stream)
        let data =  reader.readDataToEnd()
        if isCompressed {
            guard let decompressed = data.decompress(withAlgorithm: .zlib) else {
                throw HwpError.streamDecompressFailed(name: HwpStreamName(rawValue: stream.name)!)
            }

            let destLen = 2000
            let dest = UnsafeMutableBufferPointer<UInt8>.allocate(capacity: destLen)

            let uncompressed = try data.withUnsafeBytes { (source) throws -> Data in
                let ptr = UnsafeMutablePointer<UInt>.allocate(capacity: 1)
                defer { ptr.deallocate() }
                ptr.pointee = UInt(dest.count)
                let bound = source.bindMemory(to: UInt8.self)

                uncompress(dest.baseAddress, ptr, bound.baseAddress, uLong(bound.count))
                return Data(bytes: dest.baseAddress!, count: Int(ptr.pointee))
            }

            precondition(decompressed != uncompressed)
            return decompressed
        } else {
            return data
        }
    }
}
