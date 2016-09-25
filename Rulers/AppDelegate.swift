import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet private weak var window: NSWindow!
    private var mouse: Mouse!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        let window = self.window as! RulerWindow

        var config = Preset().config
        config.hasShadow = true
        config.size.width = 800
        config.size.height = 120
        config.alpha = 0.10
        config.mouseOffset.y = 30
        config.canMoveOffscreen = false

        window.apply(config: config)
        mouse = Mouse { _ in
            window.apply(config: config)
        }
        mouse.start()

        // window.isMovableByWindowBackground = true
        // window.makeKeyAndOrderFront(nil)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
    }
}
