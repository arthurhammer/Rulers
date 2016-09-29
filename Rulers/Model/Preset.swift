import Foundation

struct Preset {
    var id: String
    var name = NSLocalizedString("New Preset", comment: "Name of new preset")
    var config = WindowConfig()


    init(id: String = NSUUID().uuidString,  // FIXME: Should this be assigned here?
         name: String = NSLocalizedString("New Preset", comment: "Name of new preset"),
         config: WindowConfig = WindowConfig()) {

        self.id = id
        self.name = name
        self.config = config
    }
}


extension Preset: Equatable {
    static func == (lhs: Preset, rhs: Preset) -> Bool {
        return
            lhs.id == rhs.id
            lhs.name == rhs.name &&
            lhs.config == rhs.config
    }
}
