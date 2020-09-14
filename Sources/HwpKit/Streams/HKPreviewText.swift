import Foundation
import OLEKit

struct HKPreviewText {
    let text:String
    
    init(dataReader: DataReader) {
        text = String(data:dataReader.readDataToEnd(), encoding: .utf8) ?? "Error"
    }
}
