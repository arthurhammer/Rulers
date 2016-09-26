import Foundation

class PresetDataManager {
    var enabled = true  // Does this belong here?
    var presets = Preset.defaults
    var indexOfActivePreset = 0
}
