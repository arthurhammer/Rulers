/*
 To get a borderless, transparent, colored window **with shadow**:
 
 - The alpha is set on the window
 - The color and corner radius are drawn in the content view
 - The window will then automatically apply a shadow
 
 See also Apple's `RoundTransparentWindow` example: 
   https://developer.apple.com/library/content/samplecode/RoundTransparentWindow

 Alternatives (e.g. using the content view's layer or colors with alpha baked in) 
 didn't work as reliably.
 */

import Cocoa

/// Intented to be used exclusively with `RulerContentView` as content view.
final class RulerWindow: NSWindow {

    var rulerView: RulerView {
        return contentView as! RulerView
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
