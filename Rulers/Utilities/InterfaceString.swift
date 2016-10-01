import Foundation

struct InterfaceString {

    struct Preset {
        static let `default` = NSLocalizedString("Reading Ruler", comment: "Name of reading ruler preset")
        static let line = NSLocalizedString("Reading Line", comment: "Name of reading line preset")
        static let box = NSLocalizedString("Box", comment: "Name of box preset")
        static let night = NSLocalizedString("Night Shade", comment: "Name of night shade preset")
    }

    struct StatusItem {
        static let enable = NSLocalizedString("Enable Rulers", comment: "Enable app status menu item")
        static let disable = NSLocalizedString("Disable Rulers", comment: "Disable app status menu item")
        static let quit = NSLocalizedString("Quit Rulers", comment: "Quit app status menu item")
    }

    static let app = NSLocalizedString("Rulers", comment: "Name of app")
}
