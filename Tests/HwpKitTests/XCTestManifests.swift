import XCTest

#if !canImport(ObjectiveC)
    public func allTests() -> [XCTestCaseEntry] {
        [
            testCase(BasicTests.allTests),
            testCase(VersionTests.allTests),
            testCase(HwpUtilTests.allTests),
        ]
    }
#endif
