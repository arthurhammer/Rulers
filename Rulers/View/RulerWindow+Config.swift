import Cocoa

extension RulerWindow {

    func apply(config: WindowConfig) {
        applyStyle(for: config)
        applyPosition(for: config)
    }

    func applyStyle(for config: WindowConfig) {
        level = NSWindow.level(for: .overlayWindow)  // CONFIG
        collectionBehavior = [.stationary]
        if config.joinsAllSpaces {
            collectionBehavior.insert(.canJoinAllSpaces)
        }
        ignoresMouseEvents = config.ignoresMouseEvents
        hasShadow = config.hasShadow
        alphaValue = config.alpha.cg
        backgroundColor = .clear
        rulerView.backgroundColor = config.color.withAlphaComponent(1)
        rulerView.cornerRadius = config.cornerRadius
    }

    func applyPosition(for config: WindowConfig) {
        guard let screen = screen else {  // FIXME: Extract screen/mouse handling?
            Swift.print("No screen found.")
            return
        }

        let newFrame = frame(for: config,
                             screenFrame: screen.frame,
                             mouseLocation: Mouse.location())  // FIXME: Extract screen/mouse
        setFrame(newFrame, display: true)
    }

    func frame(for config: WindowConfig,
               screenFrame: CGRect,
               mouseLocation: CGPoint) -> CGRect {

        let size = config.size.resolve(with: screenFrame.size)
        let center = mouseLocation
        let offset = config.mouseOffset
        let clamping = config.canMoveOffscreen ? .infinite : screenFrame

        return CGRect(origin: .zero, size: size)
            .centered(at: center)
            .offset(by: offset)
            .clamped(to: clamping)
            .integral
    }
}
