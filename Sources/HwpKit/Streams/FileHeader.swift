import OLEKit

struct HwpFileHeader: Stream {
    let signature: String
    let version: HwpVersion

    let encryptVersion: UInt32
    let 공공누리: UInt8

    init(dataReader: DataReader) {
        signature = String(data: dataReader.readData(ofLength: 32), encoding: .ascii) ?? "Error"

        let revision: UInt8 = dataReader.read()
        let build: UInt8 = dataReader.read()
        let minor: UInt8 = dataReader.read()
        let major: UInt8 = dataReader.read()
        version = HwpVersion(major: major, minor: minor, build: build, revision: revision)
        let _:UInt32 = dataReader.read()
        let _:UInt32 = dataReader.read()
        encryptVersion = dataReader.read()
        공공누리 = dataReader.read()
    }
}
