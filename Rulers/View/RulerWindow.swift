/*
 To achieve a borderless, transparent, colored, rounded window **with** shadow:
 
 - Alpha is set on the window
 - Window's background color is clear
 - Window is opaque and borderless
 - The actual color and corner radius are drawn in the content view
 
 The window will then automatically apply a shadow
 
 See also Apple's `RoundTransparentWindow` example where they do just that:
   https://developer.apple.com/library/content/samplecode/RoundTransparentWindow

 Alternatives (e.g. using the content view's layer properties or colors with alpha 
 baked in) don't seem to work as reliably or are more complex (drawing the shadow 
 manually).
 */

import Cocoa

/// Intented to be used with `RulerView` as content view.
final class RulerWindow: NSWindow {

    var rulerView: RulerView {
        return contentView as! RulerView
    }

    override var canBecomeKey: Bool {
        return false
    }

    override var canBecomeMain: Bool {
        return false
    }

    override init(contentRect: NSRect,
                  styleMask style: NSWindowStyleMask,
                  backing bufferingType: NSBackingStoreType,
                  defer flag: Bool) {

        super.init(contentRect: contentRect,
                   styleMask: .borderless,  // borderless
                   backing: bufferingType,
                   defer: flag)

        backgroundColor = .clear
        isOpaque = false
    }
}
