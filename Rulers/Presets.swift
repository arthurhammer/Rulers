import Foundation

/// Presets data manager.
/// Invariant: Presets have unique ids.
final class Presets: Subscribable {

    fileprivate(set) var presets = Preset.defaults
    fileprivate(set) lazy var active: Preset? = self.presets.first
    fileprivate(set) var enabled = true

    fileprivate var store: UserDefaults
    typealias Subscriber = PresetsSubscriber
    lazy var subscribers: Subscribers<Subscriber> = Subscribers()


    init(store: UserDefaults) {
        self.store = store
    }


    // MARK: - Preset Management

    func add(_ preset: Preset) {
        if index(forIdOf: preset) != nil { return }
        presets.append(preset)

        save()
        notify {
            $0.presets(self, didInsertAt: self.presets.count-1)
        }
    }

    // FIXME: Case deleted == active?
    func delete(preset: Preset) {
        guard let index = index(forIdOf: preset) else { return }
        presets.remove(at: index)

        save()
        notify {
            $0.presets(self, didDeleteAt: index)
        }
    }

    // FIXME: Case updated == active?
    func update(preset: Preset) {
        guard let index = index(forIdOf: preset) else { return }
        presets[index] = preset

        save()
        notify {
            $0.presets(self, didUpdateAt: index)
        }
    }

    func setActive(preset: Preset) {
        guard let index = index(forIdOf: preset) else { return }
        active = presets[index]

        save()
        notify {
            $0.presets(self, didActivate: self.active!, at: index)
        }
    }

    func setEnabled(_ enabled: Bool) {
        self.enabled = enabled

        save()
        notify {
            $0.presets(self, didChangeEnabled: enabled)
        }
    }
}


fileprivate extension Presets {

    func save() {
        print("Saving")
        // FIXME: Unimplemented
    }

    /// Index of the first preset with the same `id`. 
    func index(forIdOf preset: Preset) -> Int? {
        return presets.index { $0.id == preset.id }
    }
}
