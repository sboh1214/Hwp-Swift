import Foundation
import OLEKit

/** 부호 없는 한 바이트(0~255) */
public typealias BYTE = UInt8
/** 16비트 컴파일러에서 ‘unsigned int’에 해당 */
public typealias WORD = UInt16
/** 16비트 컴파일러에서 ‘unsigned long’에 해당 */
public typealias DWORD = UInt32
/**
 WCHAR는 한글의 내부 코드로 표현된 문자 한 글자를 표현하는 자료형이다. 한글의 내부 코드는 한글, 영문, 한자를 비롯해 모든 문자가 2 바이트의 일정한 길이를 가진다.
 */
public typealias WCHAR = UniChar
/**
 HWPUNIT과 SHWPUNIT는 문자의 크기, 그림의 크기, 용지 여백 등, 문서를 구성하는 요소들의 크기를 표현하기 위한 자료형이다.
 문서 출력 장치의 해상도는 가변적이기 때문에, 크기 정보를 점(도트)의 수로 표현할 수는 없다.
 따라서 일정한 단위를 기준으로 해야 하는데, 한글에서는 1/7200인치를 기본 단위로 사용한다.
 예를 들어 [가로 2 인치 x 세로 1 인치]짜리 그림의 크기를 HWPUNIT 형으로 표현하면 각각 14400 x 7200이 된다.
 */
public typealias HWPUNIT = UInt32
/** 1/7200인치로 표현된 한글 내부 단위 */
public typealias SHWPUNIT = Int32
/** INT16 과 같다. */
public typealias HWPUNIT16 = Int16

// Data to [bytes]
extension Data {
    var bytes: [UInt8] {
        [UInt8](self)
    }

    var bits: [Bool] {
        reduce([Bool]()) { $0 + $1.bits }
    }

    var stringASCII: String? {
        String(data: self, encoding: .ascii)
    }
}

extension Array where Element == Data {
    func toBits() -> [Bool] {
        reduce([Bool]()) { $0 + $1.bits }
    }
}

extension Array where Element == WCHAR {
    public func toString() -> String {
        reduce("") {result, current in result + String(Character(UnicodeScalar(current)!))}
    }
}

// [bytes] to Data
extension Array where Element == UInt8 {
    var data: Data {
        Data(self)
    }
}

extension UInt8 {
    var bits: [Bool] {
        var byte = self
        var bits = [Bool](repeating: false, count: 8)
        for index in 0 ..< 8 {
            let currentBit = byte & 0x01
            if currentBit != 0 {
                bits[index] = true
            }

            byte >>= 1
        }

        return bits
    }
}

extension UInt32 {
    func toBits() -> [Bool] {
        var byte = self
        var bits = [Bool](repeating: false, count: 32)
        for index in 0 ..< 32 {
            let currentBit = byte & 0x01
            if currentBit != 0 {
                bits[index] = true
            }

            byte >>= 1
        }

        return bits
    }
}
