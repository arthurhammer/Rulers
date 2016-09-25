import Cocoa


final class EventMonitor {

    enum Scope {
        case local
        case global
        case localAndGlobal
    }

    typealias Handler = (NSEvent) -> ()
    
    fileprivate var monitors = [Any]()
    fileprivate let scope: Scope
    fileprivate let mask: NSEventMask
    fileprivate let handler: Handler


    /// Event monitoring automatically  stops when the instance is dealloced.
    init(scope: Scope, mask: NSEventMask, handler: @escaping Handler) {
        self.scope = scope
        self.mask = mask
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

        case .local, .localAndGlobal:
            addLocalMonitor()
            fallthrough

        case .global, .localAndGlobal:
            addGlobalMonitor()
        }
    }

    func removeMonitors() {
        monitors.forEach(NSEvent.removeMonitor)
        monitors = []
    }

    func addLocalMonitor() {
        monitors.append(
            NSEvent.addLocalMonitorForEvents(matching: mask, handler: localHandler)
        )
    }

    func addGlobalMonitor() {
        monitors.append(
            NSEvent.addGlobalMonitorForEvents(matching: mask, handler: handler)
        )
    }

    var localHandler: (NSEvent) -> NSEvent {
        return { [weak self] event in
            self?.handler(event)
            return event
        }
    }
}
