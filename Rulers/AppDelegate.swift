import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet private weak var window: NSWindow!


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        let window = self.window as! RulerWindow

        window.setFrame(
            NSRect(x: 500, y: 500, width: 600, height: 200),
            display: true)

        var config = WindowConfig()
        config.hasShadow = true
        config.size.width = 800

        window.apply(config: config)

        window.isMovableByWindowBackground = true  
        window.makeKeyAndOrderFront(nil)

        // border with transparent window (frame)
        // movable by dragging, does not follow mouse
        // COMMIT!!! Growing again!!
        // Length: what if we want to resize with mouse? resizable?
    }

    func applicationWillTerminate(_ aNotification: Notification) {
    }
}
