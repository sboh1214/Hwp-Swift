import Foundation

protocol HwpStream {
    init(_ data: Data, _ report: (HwpReportable)throws->Void) throws
}
