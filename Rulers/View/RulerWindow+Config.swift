import Cocoa

extension RulerWindow {

    func apply(config: WindowConfig) {
        collectionBehavior = config.joinsAllSpaces ? .canJoinAllSpaces : []
        alphaValue = config.alpha.cg

        backgroundColor = .clear
        rulerView.backgroundColor = config.color.withAlphaComponent(1)
        rulerView.cornerRadius = config.cornerRadius
    }
}
