import Foundation

extension Array {
   /**
    * ## Examples:
    * var arr = [0,1,2,3]
    * arr.remove((0..<2)) // 0,1
    * arr // 2,3
    */
    mutating func pop<T: BinaryInteger>(_ count: T) -> Array {
    let values = Array(self[0..<Int(count)])
        self.removeSubrange(0..<Int(count))
      return values
   }
}

extension Array where Element == WCHAR {
    public var string: String {
        reduce("") {result, current in result + String(Character(UnicodeScalar(current)!))}
    }

    public init(_ string: String) {
        self = string.utf16.map {$0}
    }
}

// [bytes] to Data
extension Array where Element == UInt8 {
    var data: Data {
        Data(self)
    }
}
