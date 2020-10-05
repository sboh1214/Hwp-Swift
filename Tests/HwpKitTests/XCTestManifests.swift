import XCTest

#if !canImport(ObjectiveC)
    public func allTests() -> [XCTestCaseEntry] {
        [
            testCase(BasicTests.allTests),
            testCase(NooriDocInfoTests.allTests),
            testCase(NooriSectionTests.allTests),
            testCase(VersionTests.allTests),
            testCase(HwpUtilTests.allTests)
        ]
    }
#endif
