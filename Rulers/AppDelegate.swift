import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    private var rulerController: RulerWindowController!
    private var statusItemController: StatusItemController!


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        let presetManager = PresetDataManager()
        var preset = presetManager.presets.first!

        preset.config.hasShadow = true
        preset.config.size.width = 800
        preset.config.size.height = 120
        preset.config.alpha = 0.10
        preset.config.mouseOffset.y = 30
        preset.config.canMoveOffscreen = false

        rulerController = RulerWindowController(preset: preset)
        statusItemController = StatusItemController(presetDataManager: presetManager)

        rulerController.rulerEnabled = true
    }

    func applicationWillTerminate(_ aNotification: Notification) {
    }
}
