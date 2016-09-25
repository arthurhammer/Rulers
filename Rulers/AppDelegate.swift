import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    private var rulerController: RulerWindowController!


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        var preset = Preset()

        preset.config.hasShadow = true
        preset.config.size.width = 800
        preset.config.size.height = 120
        preset.config.alpha = 0.10
        preset.config.mouseOffset.y = 30
        preset.config.canMoveOffscreen = false

        rulerController = RulerWindowController(preset: preset)
        rulerController.rulerEnabled = true

        // window.isMovableByWindowBackground = true
        // window.makeKeyAndOrderFront(nil)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
    }
}
