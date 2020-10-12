import Foundation
import HwpKitFramework

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
    let expected =  try! HwpFile(filePath: url.path)
    let actual = HwpFile()
    return (expected, actual)
}
//swiftlint:enable force_try
