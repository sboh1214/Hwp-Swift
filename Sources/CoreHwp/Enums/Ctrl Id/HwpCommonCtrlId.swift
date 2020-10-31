public enum HwpCommonCtrlId: UInt32, HwpPrimitive {
    /**tbl */
    case table = 1952607264

    /**$lin*/
    case line = 611084654
    /**$lec*/
    case rectangle = 611476835
    /**$ell*/
    case ellipse = 610626668
    /**$arc*/
    case arc = 610366051
    /**$pol*/
    case polygon = 611348332
    /**$cur*/
    case curve = 610497906

    /**equd*/
    case equation = 1701934436
    /**$pic*/
    case picture = 611346787
    /**$ole*/
    case ole = 611282021
    /**$con*/
    case container = 610496366
    /**
     gso
     NOTE: (@hahnlee) 공개된 문서에서 자세히 설명되어 있지는 않으나, 개채요소 설명에 따라 GenShapeObject로 추측됨
     */
    case genShapeObject = 1735618336
}
