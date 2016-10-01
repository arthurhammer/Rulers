import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    fileprivate lazy var presets = Presets(store: .standard)
    fileprivate lazy var statusItemController: StatusItemController =
        StatusItemController(presets: self.presets)
    fileprivate lazy var rulerController: RulerWindowController =
        RulerWindowController(preset: self.presets.active!)


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        presets.add(subscriber: self)
        statusItemController.addStatusItem()
        rulerController.enabled = true
    }

    func applicationWillTerminate(_ aNotification: Notification) {
    }
}


extension AppDelegate: PresetsSubscriber {
    func presets(_ presets: Presets, didActivate preset: Preset, at index: Int) {
        rulerController.preset = preset
    }

    func presets(_ presets: Presets, didChangeEnabled enabled: Bool) {
        rulerController.enabled = enabled
    }
}
