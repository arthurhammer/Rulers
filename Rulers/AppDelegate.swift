import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        let window = self.window as! RulerWindow

        window.setFrame(
            NSRect(x: 500, y: 500, width: 600, height: 200),
            display: true)

        let config = WindowConfig()
        window.apply(config: config)

        window.isMovableByWindowBackground = true  
        window.makeKeyAndOrderFront(nil)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
    }
}
