
protocol PresetsSubscriber: class {
    func presets(_ presets: Presets, didInsertAt index: Int)
    func presets(_ presets: Presets, didDeleteAt index: Int)
    func presets(_ presets: Presets, didUpdateAt index: Int)
    func presets(_ presets: Presets, didActivate preset: Preset, at index: Int)
        func presets(_ presets: Presets, didChangeEnabled enabled: Bool)
}


extension PresetsSubscriber {
    func presets(_ presets: Presets, didInsertAt index: Int) { }
    func presets(_ presets: Presets, didDeleteAt index: Int) { }
    func presets(_ presets: Presets, didUpdateAt index: Int) { }
    func presets(_ presets: Presets, didActivate preset: Preset, at index: Int) { }
    func presets(_ presets: Presets, didChangeEnabled enabled: Bool) { }
}
