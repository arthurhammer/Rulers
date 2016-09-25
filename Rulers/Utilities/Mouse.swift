import Cocoa

final class Mouse {

    typealias Handler = (CGPoint) -> ()
    fileprivate let onMove: Handler

    fileprivate lazy var monitor: EventMonitor =
        EventMonitor(events: .anyMouseMove,
                     scope: .any,
                     handler: self.eventHandler)

    /// Mouse monitoring automatically stops when the instance is dealloced.
    /// - parameter onMove: Mouse move handler. Its argument is the mouse location
    ///                     in screen coordinates.
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
    var eventHandler: EventMonitor.Handler {
        return { [weak self] _ in
            self?.onMove(Mouse.location())
        }
    }
}
