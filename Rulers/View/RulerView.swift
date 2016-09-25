import Cocoa

final class RulerView: NSView {

    var backgroundColor = NSColor.green {
        didSet {
            needsDisplay = true
        }
    }
    var cornerRadius = 0.0 {
        didSet {
            needsDisplay = true
        }
    }

    override func draw(_ dirtyRect: NSRect) {
        // Clear rect
        NSColor.clear.set()
        NSRectFill(bounds)

        // Draw rounded rect
        backgroundColor.set()
        let radius = cornerRadius.cg
        NSBezierPath(roundedRect: bounds, xRadius: radius, yRadius: radius).fill()
    }
}
