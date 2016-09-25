import Cocoa

extension NSWindow {
    static func level(for key: CGWindowLevelKey) -> Int {
        return Int(CGWindowLevelForKey(key))
    }
}
