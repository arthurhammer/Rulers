import Foundation

protocol SubscriptionProvider {
    associatedtype Subscriber
    func add(_ subscriber: Subscriber)
    func remove(_ subscriber: Subscriber)
    func notify(with block: (Subscriber) -> ())
}

/// Intended to be used with reference types `T` exclusively.
/// Unfortunately, Swift's generics system doesn't let us easily
/// enforce that (in case `T` is a protocol). Neither statically 
/// nor dynamically, yikes!
final class Subscribers<T>: SubscriptionProvider {

    private let subscribers: NSHashTable<AnyObject>


    init(weakObjects: Bool = true) {
        subscribers = weakObjects
            ? NSHashTable<AnyObject>.weakObjects()
            : NSHashTable<AnyObject>()
    }

    func add(_ subscriber: T) {
        subscribers.add(subscriber as AnyObject)
    }

    func remove(_ subscriber: T) {
        subscribers.remove(subscriber as AnyObject)  // Unsafe: Non-ref. types will not be removed.
    }

    func notify(with block: (T) -> ()) {
        subscribers.allObjects
            .map { $0 as! T }
            .forEach(block)
    }
}


// Optional: Flatten `Provider` methods onto `Subscribable`.

protocol Subscribable {
    associatedtype Subscriber
    associatedtype Provider: SubscriptionProvider
    var subscribers: Provider { get }
}


extension Subscribable where Subscriber == Provider.Subscriber {
    func add(subscriber: Subscriber) {
        subscribers.add(subscriber)
    }

    func remove(subscriber: Subscriber) {
        subscribers.remove(subscriber)
    }

    func notify(with block: (Subscriber) -> ()) {
        subscribers.notify(with: block)
    }
}
