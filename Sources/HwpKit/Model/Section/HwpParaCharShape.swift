import Foundation

/**
 문단의 글자 모양
 
 Tag ID : HWPTAG_PARA_CHAR_SHAPE
 */
public struct HwpParaCharShape: HwpData {
    /**글자 모양이 바뀌는 시작 위치*/
    public var startingIndex: [UInt32]
    /**글자 모양 ID*/
    public var shapeId: [UInt32]

    init(_ data: Data) throws {
        var reader = DataReader(data)
        defer {
            precondition(reader.isEOF())
        }

        var startingIndex = [UInt32]()
        var shapeId = [UInt32]()
        while !reader.isEOF() {
            startingIndex.append(reader.read(UInt32.self))
            shapeId.append(reader.read(UInt32.self))
        }
        self.startingIndex = startingIndex
        self.shapeId = shapeId
    }
}
