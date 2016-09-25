import Foundation

typealias Offset = CGPoint


/**
 A size with optional width/height.

 Non-optional values denote fixed width/heights.
 `nil` denotes an unspecified value, in this case the screen's 
 (dynamic) width/height.
 */
struct Size {
    var width: Double?
    var height: Double?
}


extension Size {
    /// Resolve the size's height/width so they are fully specified.
    func resolve(with size: CGSize) -> CGSize {
        return CGSize(
            width: width ?? Double(size.width),
            height: height ?? Double(size.height)
        )
    }
}


extension Size: Equatable {
    static func == (lhs: Size, rhs: Size) -> Bool {
        return (lhs.width == rhs.width) && (lhs.height == rhs.height)
    }
}
