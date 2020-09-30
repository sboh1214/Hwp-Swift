import Foundation

public struct HwpBorderFill {
    let property: UInt16
    let borderType: [UInt8]
    let borderThickness: [UInt8]
    let borderColor: [COLORREF]
    let diagonalType: UInt8
    let diagonalThickness: UInt8
    let diagonalColor: COLORREF
    let fillInfo: [BYTE]
}
