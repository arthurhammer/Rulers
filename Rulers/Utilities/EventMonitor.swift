import Cocoa

final class EventMonitor {

    enum Scope {
        case local
        case global
        case any
    }

    typealias Handler = (NSEvent) -> ()
    
    fileprivate var monitors = [Any]()
    fileprivate let scope: Scope
    fileprivate let events: NSEventMask
    fileprivate let handler: Handler


    /// Event monitoring automatically  stops when the instance is dealloced.
    init(events: NSEventMask, scope: Scope, handler: @escaping Handler) {
        self.scope = scope
        self.events = events
        self.handler = handler
    }
    
    deinit {
        stop()
    }
    
    func start() {
        stop()
        addMonitors()
        
    }
    
    func stop() {
        removeMonitors()
    }
}


fileprivate extension EventMonitor {

    func addMonitors() {
        switch scope {

        case .local, .any:
            addLocalMonitor()
            fallthrough

        case .global, .any:
            addGlobalMonitor()
        }
    }

    func removeMonitors() {
        monitors.forEach(NSEvent.removeMonitor)
        monitors = []
    }

    func addLocalMonitor() {
        monitors.append(
            NSEvent.addLocalMonitorForEvents(matching: events, handler: localHandler)
        )
    }

    func addGlobalMonitor() {
        monitors.append(
            NSEvent.addGlobalMonitorForEvents(matching: events, handler: handler)
        )
    }

    var localHandler: (NSEvent) -> NSEvent {
        return { [weak self] event in
            self?.handler(event)
            return event
        }
    }
}
