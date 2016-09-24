import Foundation
import class AppKit.NSColor

struct WindowConfig {
    var size = Size(width: .max, height: 60)
    var mouseOffset = Offset(x: 0, y: 0)
    var color = NSColor.yellow
    var alpha = 0.2
    var cornerRadius = 12.0
    var canMoveOffscreen = true
    var joinsAllSpaces = true
}
