import Cocoa

// FIXME: Refactoring + Cleanup

extension RulerWindow {

    func updateStyle(for config: WindowConfig) {
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

    func updatePosition(forConfig config: WindowConfig,
                        mouseLocation: CGPoint,
                        screenFrame: CGRect) {

        setFrame(frame(for: config,
                       mouseLocation: mouseLocation,
                       screenFrame: screenFrame),
                 display: true)
    }

    func frame(for config: WindowConfig,
               mouseLocation: CGPoint,
               screenFrame: CGRect) -> CGRect {

        let size = config.size.resolved(with: screenFrame.size)
        let clamping = config.canMoveOffscreen ? .infinite : screenFrame

        return CGRect(origin: .zero, size: size)
            .centered(at: mouseLocation)
            .offset(by: config.mouseOffset)
            .clamped(to: clamping)
            .integral
    }
}
