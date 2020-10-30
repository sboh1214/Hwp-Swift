import Foundation
import XCTest
import CoreHwp

//swiftlint:disable force_try
func openHwp(_ location: String, _ name: String) -> HwpFile {
    let url = URL(fileURLWithPath: location)
        .deletingLastPathComponent()
        .appendingPathComponent(name + ".hwp")
    return try! HwpFile(filePath: url.path)
}

func createHwp(_ location: String, _ name: String) -> (HwpFile, HwpFile) {
    let url = URL(fileURLWithPath: location)
        .deletingLastPathComponent()
        .appendingPathComponent(name + ".hwp")
    let official =  try! HwpFile(filePath: url.path)
    let this = HwpFile()
    return (official, this)
}
//swiftlint:enable force_try
