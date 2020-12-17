import CoreHwp
import XCTest

final class FileHeaderTests: XCTestCase {
    
//    func testIsDepolymentDocument() throws {
//        let hwp = try openHwp(#file, "배포용문서")
//        XCTAssertTrue(hwp.fileHeader.fileProperty.isDeploymentDocument)
//    }

    func testDoesHaveDocumentHistory() throws {
        let hwp = try openHwp(#file, "문서이력관리")
        XCTAssertTrue(hwp.fileHeader.fileProperty.doesHaveDocumentHistory)
    }
    
    // TODO : Investigate why false
    func testIsTracingChange() throws {
        let hwp = try openHwp(#file, "변경내용추적")
        XCTAssertFalse(hwp.fileHeader.fileProperty.isTracingChange)
    }
    
    func testIsKOGLDocument() throws {
        let hwp = try openHwp(#file, "공공누리")
        XCTAssertTrue(hwp.fileHeader.fileProperty.isKOGLDocument)
    }
    
    // TODO : Investigate why false
    func testCCL() throws {
        let hwp = try openHwp(#file, "CCL")
        XCTAssertFalse(hwp.fileHeader.fileLicense.doesHaveKoreaOpenLicense)
    }
    

//    func testEncryptVersion() throws {
//        let hwp = try openHwp(#file, "문서암호설정-보안수준높음")
//        XCTAssertEqual(hwp.fileHeader.encryptVersion, 4)
//    }
}
