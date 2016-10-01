import Cocoa

final class RulerWindow: NSPanel {

    /// Intented to be used with `RulerView` as content view.
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
                   styleMask: [.borderless, .nonactivatingPanel],
                   backing: bufferingType,
                   defer: flag)

        backgroundColor = .clear
        isOpaque = false
    }
}
