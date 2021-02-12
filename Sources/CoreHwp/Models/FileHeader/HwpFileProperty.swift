import Foundation

public struct HwpFileProperty {
    /** 압축 여부 */
    public var isCompressed: Bool
    /** 암호 설정 여부 */
    public var isEncrypted: Bool
    /** 배포용 문서 여부 */
    public var isDeploymentDocument: Bool
    /** 스크립트 저장 여부 */
    public var doesSaveScript: Bool
    /** DRM 보안 문서 여부 */
    public var isDRMDocument: Bool
    /** XMLTemplate 스토리지 존재 여부 */
    public var doesHaveXMLTemplate: Bool
    /** 문서 이력 관리 존재 여부 */
    public var doesHaveDocumentHistory: Bool
    /** 전자 서명 정보 존재 여부 */
    public var doesHaveSignature: Bool
    /** 공인 인증서 암호화 여부 */
    public var doesEncryptAccreditedCertificate: Bool
    /** 전자 서명 예비 저장 여부 */
    public var doesSaveSpareSignature: Bool
    /** 공인 인증서 DRM 보안 문서 여부 */
    public var isAccreditedCertificateDRMDocment: Bool
    /** CCL 문서 여부 */
    public var isCCLDocument: Bool
    /** 모바일 최적화 여부 */
    public var doesOptimizeMobile: Bool
    /** 개인 정보 보안 문서 여부 */
    public var isPersonalInformationSecurityDocument: Bool
    /** 변경 추적 문서 여부 */
    public var isTracingChange: Bool
    /** 공공누리(KOGL) 저작권 문서 */
    public var isKOGLDocument: Bool
    /** 비디오 컨트롤 포함 여부 */
    public var doesHaveVideoControl: Bool
    /** 차례 필드 컨트롤 포함 여부 */
    public var doesHaveTOCFieldControl: Bool

    var unused: [Bool]
}

extension HwpFileProperty: HwpFromUInt {
    typealias UIntType = UInt32

    init(_ reader: inout BitsReader<UIntType>) throws {
        isCompressed = reader.readBit()
        isEncrypted = reader.readBit()
        isDeploymentDocument = reader.readBit()
        doesSaveScript = reader.readBit()
        isDRMDocument = reader.readBit()
        doesHaveXMLTemplate = reader.readBit()
        doesHaveDocumentHistory = reader.readBit()
        doesHaveSignature = reader.readBit()
        doesEncryptAccreditedCertificate = reader.readBit()
        doesSaveSpareSignature = reader.readBit()
        isAccreditedCertificateDRMDocment = reader.readBit()
        isCCLDocument = reader.readBit()
        doesOptimizeMobile = reader.readBit()
        isPersonalInformationSecurityDocument = reader.readBit()
        isTracingChange = reader.readBit()
        isKOGLDocument = reader.readBit()
        doesHaveVideoControl = reader.readBit()
        doesHaveTOCFieldControl = reader.readBit()

        unused = reader.readBits(14)
    }
}

extension HwpFileProperty {
    init() {
        isCompressed = true
        isEncrypted = false
        isDeploymentDocument = false
        doesSaveScript = false
        isDRMDocument = false
        doesHaveXMLTemplate = false
        doesHaveDocumentHistory = false
        doesHaveSignature = false
        doesEncryptAccreditedCertificate = false
        doesSaveSpareSignature = false
        isAccreditedCertificateDRMDocment = false
        isCCLDocument = false
        doesOptimizeMobile = false
        isPersonalInformationSecurityDocument = false
        isTracingChange = false
        isKOGLDocument = false
        doesHaveVideoControl = false
        doesHaveTOCFieldControl = false

        unused = Array(repeating: false, count: 14)
    }
}
