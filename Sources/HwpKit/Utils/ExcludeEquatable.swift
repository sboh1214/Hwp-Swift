import Foundation

@propertyWrapper
public struct ExcludeEquatable<Value: HwpPrimitive>: HwpPrimitive {
    public var wrappedValue: Value

    public init(wrappedValue: Value) {
        self.wrappedValue = wrappedValue
    }

    public static func == (lhs: ExcludeEquatable<Value>, rhs: ExcludeEquatable<Value>) -> Bool {
        true
    }
}
