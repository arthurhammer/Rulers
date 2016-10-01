import Foundation

/// Presets data manager.
/// Invariant: Presets have unique ids.
final class Presets: Subscribable {

    fileprivate(set) var presets = [Preset]()
    fileprivate(set) var active: Preset?
    fileprivate(set) var enabled = true

    fileprivate var store: UserDefaults
    typealias Subscriber = PresetsSubscriber
    lazy var subscribers: Subscribers<Subscriber> = Subscribers()


    init(store: UserDefaults) {
        self.store = store
        registerDefaults()
        load()
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

    struct StoreKey {
        static let presets = "presets"
        static let enabled = "enabled"
        static let activePresetId = "activePresetId"
    }

    func registerDefaults() {
        store.register(defaults: [
            StoreKey.enabled: true,
            StoreKey.presets: Preset.defaults.map { $0.propertyListValue },
            StoreKey.activePresetId: Preset.defaults.first?.id ?? "nil"
        ])
    }

    func save() {
        store.set(enabled, forKey: StoreKey.enabled)
        store.set(presets.map { $0.propertyListValue }, forKey: StoreKey.presets)
        store.set(active?.id, forKey: StoreKey.activePresetId)
    }

    func load() {
        enabled = store.bool(forKey: StoreKey.enabled)
        presets = (store.array(forKey: StoreKey.presets) ?? [])
            .flatMap { $0 as? PropertyList }
            .flatMap(Preset.init(propertyList:))
        let id = store.string(forKey: StoreKey.activePresetId)
        active = presets.first { $0.id == id }
    }

    /// Index of the first preset with the same id.
    func index(forIdOf preset: Preset) -> Int? {
        return presets.index { $0.id == preset.id }
    }
}
