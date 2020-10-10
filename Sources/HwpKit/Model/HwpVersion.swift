import Foundation

/**
 파일 버전. 0xMMnnPPrr의 형태(예 5.0.3.0)
 - MM: 문서 형식의 구조가 완전히 바뀌는 것을 나타냄. 숫
 자가 다르면 구 버전과 호환 불가능.
 - nn: 큰 구조는 동일하나, 큰 변화가 있는 것을 나타냄. 숫
 자가 다르면 구 버전과 호환 불가능.
 - PP: 구조는 동일, Record가 추가되었거나, 하위 버전에서
 호환되지 않는 정보가 추가된 것을 나타냄. 숫자가 달라도
 구 버전과 호환 가능.
 - rr: Record에 정보들이 추가된 것을 나타냄. 숫자가 달라
 도 구 버전과 호환 가능.
 */
public struct HwpVersion: HwpFromData, Comparable {
    public let major: UInt8
    public let minor: UInt8
    public let build: UInt8
    public let revision: UInt8

    init() {
        major = 5
        minor = 1
        build = 0
        revision = 1
    }

    init(_ data: Data) {
        var reader = DataReader(data)
        revision = reader.read(UInt8.self)
        build = reader.read(UInt8.self)
        minor = reader.read(UInt8.self)
        major = reader.read(UInt8.self)
    }

    init(_ major: Int, _ minor: Int, _ build: Int, _ revision: Int) {
        self.major = UInt8(major)
        self.minor = UInt8(minor)
        self.build = UInt8(build)
        self.revision = UInt8(revision)
    }

    public static func < (lhs: HwpVersion, rhs: HwpVersion) -> Bool {
        if lhs.major < rhs.major {
            return true
        }
        if lhs.major > rhs.major {
            return false
        }
        if lhs.minor < rhs.minor {
            return true
        }
        if lhs.minor > rhs.minor {
            return false
        }
        if lhs.build < rhs.build {
            return true
        }
        if lhs.build > rhs.build {
            return false
        }
        if lhs.revision < rhs.revision {
            return true
        }
        return false
    }
}
