import Cocoa

class RulerWindowController: NSWindowController, NSWindowDelegate {

    var preset: Preset {
        didSet { updateRuler() }
    }

    /// Designated method to show or hide the ruler.
    var rulerEnabled = true {
        didSet { showOrHideWindow() }
    }

    fileprivate lazy var mouse: Mouse = {
        return Mouse(onMove: { [weak self] _ in
            self?.updateRulerPosition()
        })
    }()

    override var windowNibName: String { return "RulerWindow" }


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

    fileprivate var ruler: RulerWindow {
        // Window exists as long as controller does and type is fixed.
        return window as! RulerWindow
    }

    // FIXME: Refactor

    func updateRuler() {
        updateRulerStyle()
        updateRulerPosition()
    }

    func updateRulerStyle() {
        if !isWindowLoaded {  // Avoid triggering window load.
            return
        }
        ruler.updateStyle(for: preset.config)
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

    func showOrHideWindow() {
        if rulerEnabled {
            showWindow(nil)
            mouse.start()
        } else {
            close()
            mouse.stop()
        }
    }
}
