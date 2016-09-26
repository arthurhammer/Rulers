import Cocoa

extension NSStatusBar {
    static func addStatusItem(withLength length: CGFloat = NSVariableStatusItemLength) -> NSStatusItem {
        return system().statusItem(withLength: length)
    }
}


extension NSMenu {
    func addItems(_ items: [NSMenuItem]) {
        items.forEach(addItem)
    }
}


extension NSMenuItem {

    convenience init(title: String,
                     target: AnyObject? = nil,
                     action: Selector? = nil,
                     keyEquivalent: String? = nil) {

        self.init(title: title, action: action, keyEquivalent: keyEquivalent ?? "")
        self.target = target
    }

    var selected: Bool {
        get { return state == NSOnState }
        set { state = newValue ? NSOnState : NSOffState }
    }
}
