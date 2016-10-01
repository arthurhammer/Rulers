import Cocoa

final class StatusItemController {

    fileprivate lazy var statusItem: NSStatusItem = {
        let item = NSStatusBar.addStatusItem()
        item.menu = self.menu()
        item.button?.title = InterfaceString.app
        return item
    }()

    fileprivate var presets: Presets


    init(presets: Presets) {
        self.presets = presets
        presets.add(subscriber: self)
    }

    func addStatusItem() {
        _ = statusItem  // Trigger lazy load
    }
}


fileprivate extension StatusItemController {

    // MARK: - Menu

    func updateMenu() {
        // FIXME: This should be done lazily when the menu is about to be displayed
        statusItem.menu = menu()
    }

    func menu() -> NSMenu {
        let menu = NSMenu()
        menu.autoenablesItems = false

        menu.addItem(toggleEnabledItem(forState: presets.enabled))
        menu.addItem(.separator())
        menu.addItems(presets.presets.map(presetItem))
        menu.addItem(.separator())
        menu.addItem(quitItem())

        return menu
    }

     func presetItem(for preset: Preset) -> NSMenuItem {
        let item = NSMenuItem(title: preset.name,
                              target: self,
                              action: #selector(selectedPreset))
        item.selected = (preset == presets.active)
        item.isEnabled = presets.enabled
        item.representedObject = preset
        return item
    }

    func toggleEnabledItem(forState enabled: Bool) ->  NSMenuItem {
        let title = enabled
            ? InterfaceString.StatusItem.disable
            : InterfaceString.StatusItem.enable

        return NSMenuItem(title: title,
                          target: self,
                          action: #selector(toggleEnabled))
    }

    func quitItem() -> NSMenuItem {
        return NSMenuItem(title: InterfaceString.StatusItem.quit,
                          action: #selector(NSApp.terminate),
                          keyEquivalent: "q")
    }

    // MARK: - Actions

    @objc  // for target-action
    func toggleEnabled() {
        presets.setEnabled(!presets.enabled)
    }

    @objc
    func selectedPreset(_ sender: NSMenuItem) {
        if let preset = sender.representedObject as? Preset {
            presets.setActive(preset: preset)
        }
    }
}


extension StatusItemController: PresetsSubscriber {
    func presets(_ presets: Presets, didActivate preset: Preset, at index: Int) {
        updateMenu()
    }

    func presets(_ presets: Presets, didChangeEnabled enabled: Bool) {
        updateMenu()
    }
}
