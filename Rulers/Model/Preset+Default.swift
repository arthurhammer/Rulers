import Foundation
import class AppKit.NSColor

extension Preset {
    static let defaults = [
        Preset(
            name: NSLocalizedString("Default Preset", comment: "Name of default preset"),
            config: WindowConfig()
        ),
        Preset(
            name: NSLocalizedString("Reading Ruler", comment: "Name of reading ruler preset"),
            config: WindowConfig(
                size: Size(width: nil, height: 1),
                mouseOffset: Offset(x: 0, y: 7),
                canMoveOffscreen: false,
                color: NSColor(red: 253/255, green: 73/255, blue: 108/255, alpha: 1),
                alpha: 0.8,
                cornerRadius: 0,
                hasShadow: true,
                joinsAllSpaces: true,
                ignoresMouseEvents: true
            )
        ),
        Preset(
            name: NSLocalizedString("Box", comment: "Name of box preset"),
            config: WindowConfig(
                size: Size(width: 600, height: 200),
                mouseOffset: .zero,
                canMoveOffscreen: true,
                color: .gray,
                alpha: 0.3,
                cornerRadius: 12,
                hasShadow: true,
                joinsAllSpaces: true,
                ignoresMouseEvents: true
            )
        )
    ]
}
