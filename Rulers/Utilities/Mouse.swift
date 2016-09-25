import Cocoa


final class Mouse {

    fileprivate let onMove: Handler

    fileprivate lazy var monitor: EventMonitor =
        EventMonitor(scope: .localAndGlobal,
                     mask: Mouse.moveEvents,
                     handler: self.eventHandler)

    /// - parameter: Mouse location in screen coordinates
    typealias Handler = (CGPoint) -> ()

    /// Mouse monitoring automatically stops when the instance is dealloced.
    init(onMove: @escaping Handler) {
        self.onMove = onMove
    }
    
    deinit {
        stop()
    }
    
    func start() {
        monitor.start()
    }
    
    func stop() {
        monitor.stop()
    }
}


extension Mouse {
    static func location() -> CGPoint {
        return NSEvent.mouseLocation()
    }
}


fileprivate extension Mouse {
    static let moveEvents: NSEventMask = [
        .mouseMoved,
        .leftMouseDragged,
        .rightMouseDragged,
        .otherMouseDragged
    ]

    var eventHandler: EventMonitor.Handler {
        return { [weak self] _ in
            self?.onMove(Mouse.location())
        }
    }
}
