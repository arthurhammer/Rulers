import Foundation

typealias Offset = CGPoint


extension CGFloat {
    /// A placeholder value that represents the screen's dynamic width or height
    static let screen = CGFloat.infinity

    /// Resolve the dynamic screen width or height with a given fixed width or height
    func resolved(with other: CGFloat) -> CGFloat {
        return self == .screen ? other : self
    }
}


extension CGSize {
    /// Resolve the dynamic screen size with a given fixed size
    func resolved(with size: CGSize) -> CGSize {
        return CGSize(
            width: width.resolved(with: size.width),
            height: height.resolved(with: size.height)
        )
    }
}
