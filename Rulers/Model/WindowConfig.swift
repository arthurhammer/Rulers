import Foundation
import class AppKit.NSColor

struct WindowConfig {
    // Size, position
    var size = Size(width: nil, height: 80)
    var mouseOffset = Offset.zero
    var canMoveOffscreen = false

    // Style
    var color = NSColor.yellow
    var alpha = 0.2
    var cornerRadius = 6.0
    var hasShadow = true

    // Behavior
    var joinsAllSpaces = true
    var ignoresMouseEvents = true
}


extension WindowConfig: Equatable {
    static func == (lhs: WindowConfig, rhs: WindowConfig) -> Bool {
        return
            lhs.size == rhs.size &&
            lhs.mouseOffset == rhs.mouseOffset &&
            lhs.canMoveOffscreen == rhs.canMoveOffscreen &&
            lhs.color == rhs.color &&
            lhs.alpha == rhs.alpha &&
            lhs.cornerRadius == rhs.cornerRadius &&
            lhs.hasShadow == rhs.hasShadow &&
            lhs.joinsAllSpaces == rhs.joinsAllSpaces &&
            lhs.ignoresMouseEvents == rhs.ignoresMouseEvents
    }
}






protocol NSCodingProvider: NSCoding {
    associatedtype Codeable
    init(_ value: Codeable)
}

protocol NSCodeable {
    associatedtype Provider: NSCodingProvider
    var codingProvider: Provider { get }
}

extension NSCodeable where Provider.Codeable == Self {
    var codingProvider: Provider {
        return Provider(self)
    }
}

// OR JSON!?
// What if I do more structs!? encoding version nested!? How to resolve!?

extension WindowConfig: NSCodeable {

    final class Provider: NSCodingProvider {
        var value: WindowConfig
        required init(_ value: WindowConfig) { self.value = value }

        func encode(with encoder: NSCoder) {

        }

        required init?(coder decoder: NSCoder) {
            value = WindowConfig()
        }
    }
}
