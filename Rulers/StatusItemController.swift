import Cocoa

class StatusItemController { 

    var statusItem: NSStatusItem
    fileprivate var dataManager: PresetDataManager


    init(presetDataManager: PresetDataManager) {
        self.dataManager = presetDataManager
        statusItem = NSStatusBar.addStatusItem()
        statusItem.menu = menu()
        statusItem.button?.title = NSLocalizedString("Rulers", comment: "Name of app")
    }
}


// MARK: - Menu

fileprivate extension StatusItemController {

    struct PresetMenuInfo {
        let index: Int
    }

    func menu() -> NSMenu {
        let menu = NSMenu()
        menu.addItem(toggleMenuItem())
        menu.addItem(.separator())
        menu.addItems(menuItems(for: dataManager.presets))
        menu.addItem(.separator())
        menu.addItem(quitMenuItem())
        return menu
    }

    func menuItems(for presets: [Preset]) -> [NSMenuItem] {
        return presets.enumerated().map { menuItem(for: $1, at: $0) }
    }

    func menuItem(for preset: Preset, at index: Int) -> NSMenuItem {
        let item = NSMenuItem(title: preset.name,
                              target: self,
                              action: #selector(selectedPreset))
        item.selected = (index == dataManager.indexOfActivePreset)
        item.representedObject = PresetMenuInfo(index: index)
        return item
    }

    func toggleMenuItem() ->  NSMenuItem {
        return NSMenuItem(title: NSLocalizedString("Disable Rulers", comment: "Disable app menu item"), 
                          target: self,
                          action: #selector(toggleEnabled))
    }

    func quitMenuItem() -> NSMenuItem {
        return NSMenuItem(title: NSLocalizedString("Quit Rulers", comment: "Quit app menu item"),
                          action: #selector(NSApp.terminate),
                          keyEquivalent: "q")
    }
}


// MARK: - Actions

fileprivate extension StatusItemController {

    // (`@objc` for target-action)

    @objc func toggleEnabled() {
        // FIXME: Unimplemented
    }

    @objc func selectedPreset(_ sender: NSMenuItem) {
        if let info = sender.representedObject as? PresetMenuInfo {
            dataManager.indexOfActivePreset = info.index
        }
    }
}
