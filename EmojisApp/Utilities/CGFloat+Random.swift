import CoreGraphics

extension CGFloat {
    static func randomValue() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}
