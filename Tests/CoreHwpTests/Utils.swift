import Foundation
import CoreHwp

func openHwp(_ location: String, _ name: String) throws -> HwpFile {
    let url = URL(fileURLWithPath: location)
        .deletingLastPathComponent()
        .appendingPathComponent(name + ".hwp")
    return try HwpFile(fromPath: url.path)
}

func createHwp(_ location: String, _ name: String) throws -> (HwpFile, HwpFile) {
    let url = URL(fileURLWithPath: location)
        .deletingLastPathComponent()
        .appendingPathComponent(name + ".hwp")
    let this = HwpFile()
    let official =  try HwpFile(fromPath: url.path)
    return (this, official)
}
