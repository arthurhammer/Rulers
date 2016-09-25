import Cocoa

extension NSEventMask {
    static let anyMouseMove: NSEventMask = [
        .mouseMoved,
        .leftMouseDragged,
        .rightMouseDragged,
        .otherMouseDragged
    ]
}
