import OLEKit
import Foundation

// let FILE_HEADER_BYTES: Int = 256

let signatureArray: [UInt8] = [0x48, 0x57, 0x50, 0x20, 0x44, 0x6f, 0x63, 0x75, 0x6d, 0x65,
                              0x6e, 0x74, 0x20, 0x46, 0x69, 0x6c, 0x65, 0x00, 0x00, 0x00,
                              0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                              0x00, 0x00]

struct HwpFileHeader {
    let signature: String
    let revision: UInt8
    let build: UInt8

    let data: Data

    init(dataReader: DataReader) {
        data = dataReader.readDataToEnd()
        signature = String(data: dataReader.readData(ofLength: 32), encoding: .utf16LittleEndian) ?? "Error"
        revision = dataReader.read()
        build = dataReader.read()
    }
}
