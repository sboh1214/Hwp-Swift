import Foundation
import CoreHwp

func openHwp(_ location: String, _ name: String) throws -> HwpFile {
    let url = URL(fileURLWithPath: location)
        .deletingLastPathComponent()
        .appendingPathComponent(name + ".hwp")
    return try HwpFile(filePath: url.path)
}

func createHwp(_ location: String, _ name: String) throws -> (HwpFile, HwpFile) {
    let url = URL(fileURLWithPath: location)
        .deletingLastPathComponent()
        .appendingPathComponent(name + ".hwp")
    let official =  try HwpFile(filePath: url.path)
    let this = HwpFile()
    return (official, this)
}
