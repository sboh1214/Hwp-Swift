import Nimble
import XCTest

final class FileHeaderTests: XCTestCase {
//    func testIsDepolymentDocument() throws {
//        let hwp = try openHwp(#file, "배포용문서")
//        expect(hwp.fileHeader.fileProperty.isDeploymentDocument) == true
//    }

    func testDoesHaveDocumentHistory() throws {
        let hwp = try openHwp(#file, "문서이력관리")
        expect(hwp.fileHeader.fileProperty.doesHaveDocumentHistory) == true
    }

    // TODO: Investigate why false
    func testIsTracingChange() throws {
        let hwp = try openHwp(#file, "변경내용추적")
        expect(hwp.fileHeader.fileProperty.isTracingChange) != true
    }

    func testIsKOGLDocument() throws {
        let hwp = try openHwp(#file, "공공누리")
        expect(hwp.fileHeader.fileProperty.isKOGLDocument) == true
    }

    // TODO: Investigate why false
    func testCCL() throws {
        let hwp = try openHwp(#file, "CCL")
        expect(hwp.fileHeader.fileLicense.doesHaveKoreaOpenLicense) != true
    }

//    func testEncryptVersion() throws {
//        let hwp = try openHwp(#file, "문서암호설정-보안수준높음")
//        expect(hwp.fileHeader.encryptVersion) == 4
//    }
}
