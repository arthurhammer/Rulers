import Foundation
import class AppKit.NSColor

struct WindowConfig {
    // Size, position
    var size = Size(width: nil, height: 80)
    var mouseOffset = Offset.zero
    var canMoveOffscreen = false

    // Style
    var color = NSColor.yellow
    var alpha = 0.2
    var cornerRadius = 6.0
    var hasShadow = true

    // Behavior
    var joinsAllSpaces = true
    var ignoresMouseEvents = true
}


extension WindowConfig: Equatable {
    static func == (l: WindowConfig, r: WindowConfig) -> Bool {
        return
            l.size == r.size &&
            l.mouseOffset == r.mouseOffset &&
            l.canMoveOffscreen == r.canMoveOffscreen &&
            l.color == r.color &&
            l.alpha == r.alpha &&
            l.cornerRadius == r.cornerRadius &&
            l.hasShadow == r.hasShadow &&
            l.joinsAllSpaces == r.joinsAllSpaces &&
            l.ignoresMouseEvents == r.ignoresMouseEvents
    }
}

