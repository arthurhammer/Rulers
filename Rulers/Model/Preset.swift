import Foundation

struct Preset {
    var name = NSLocalizedString("New Preset", comment: "Name of new preset")
    var config = WindowConfig()
}


extension Preset: Equatable {
    static func == (l: Preset, r: Preset) -> Bool {
        return l.name == r.name && l.config == r.config
    }
}
