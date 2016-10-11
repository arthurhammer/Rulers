import Foundation
import class AppKit.NSColor

extension WindowConfig: PropertyListRepresentable {

    var propertyListValue: PropertyList {
        return [
            "size": size.propertyListValue,
            "mouseOffset": mouseOffset.propertyListValue,
            "canMoveOffscreen": canMoveOffscreen,
            "color": color.archived(),
            "alpha": alpha,
            "cornerRadius": cornerRadius,
            "hasShadow": hasShadow,
            "joinsAllSpaces": joinsAllSpaces,
            "ignoresMouseEvents": ignoresMouseEvents
        ]
    }

    init?(propertyList: PropertyList) {
        let p = propertyList

        guard
            let size = (p["size"] as? PropertyList).flatMap(CGSize.init(propertyList:)),
            let mouseOffset = (p["mouseOffset"] as? PropertyList).flatMap(Offset.init(propertyList:)),
            let canMoveOffscreen = p["canMoveOffscreen"] as? Bool,
            let color = (p["color"] as? Data).flatMap(NSColor.unarchived),
            let alpha = p["alpha"] as? Double,
            let cornerRadius = p["cornerRadius"] as? Double,
            let hasShadow = p["hasShadow"] as? Bool,
            let joinsAllSpaces = p["joinsAllSpaces"] as? Bool,
            let ignoresMouseEvents = p["ignoresMouseEvents"] as? Bool
        else {
            return nil
        }

        self = WindowConfig(
            size: size,
            mouseOffset: mouseOffset,
            canMoveOffscreen: canMoveOffscreen,
            color: color,
            alpha: alpha,
            cornerRadius: cornerRadius,
            hasShadow: hasShadow,
            joinsAllSpaces: joinsAllSpaces,
            ignoresMouseEvents: ignoresMouseEvents
        )
    }
}
