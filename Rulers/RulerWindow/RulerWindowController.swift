import Cocoa

final class RulerWindowController: NSWindowController, NSWindowDelegate {

    var preset: Preset {
        didSet { updateRuler() }
    }

    /// Designated method to show or hide the ruler.
    var enabled = true {
        didSet { showOrHideRuler() }
    }

    fileprivate lazy var mouse: Mouse = {
        return Mouse(onMove: { [weak self] l in
            self?.updateRulerPosition()
        })
    }()

    override var windowNibName: String {
        return "RulerWindow"
    }


    /// Designated initalizer
    required init(preset: Preset) {
        self.preset = preset
        super.init(window: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("Not supported")
    }

    override func windowDidLoad() {
        window!.delegate = self
        updateRuler()
    }
}


fileprivate extension RulerWindowController {

    var ruler: RulerWindow {
        // Window exists as long as controller does and type is fixed.
        return window as! RulerWindow
    }

    func updateRuler() {
        updateRulerStyle()
        updateRulerPosition()
    }

    func updateRulerStyle() {
        // Avoid triggering window load.
        if isWindowLoaded {
            ruler.updateStyle(for: preset.config)
        }
    }

    func updateRulerPosition() {
        guard let screen = ruler.screen else {
            print("No screen found")
            return
        }
        ruler.updatePosition(forConfig: preset.config,
                             mouseLocation: Mouse.location(),
                             screenFrame: screen.frame)
    }

    func showOrHideRuler() {
        if enabled {
            showWindow(nil)
            mouse.start()
        } else {
            close()
            mouse.stop()
        }
    }
}
