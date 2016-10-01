import Foundation
import class AppKit.NSColor

extension Preset {

    static let defaults = [
        Preset(
            name: InterfaceString.Preset.default,
            config: WindowConfig()
        ),

        Preset(
            name: InterfaceString.Preset.line,
            config: WindowConfig(
                size: CGSize(width: .screen, height: 1),
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
            name: InterfaceString.Preset.box,
            config: WindowConfig(
                size: CGSize(width: 600, height: 200),
                mouseOffset: .zero,
                canMoveOffscreen: true,
                color: .lightGray,
                alpha: 0.2,
                cornerRadius: 12,
                hasShadow: true,
                joinsAllSpaces: true,
                ignoresMouseEvents: true
            )
        ),

        Preset(
            name: InterfaceString.Preset.night,
            config: WindowConfig(
                size: CGSize(width: .screen, height: .screen),
                mouseOffset: .zero,
                canMoveOffscreen: false,
                color: .black,
                alpha: 0.5,
                cornerRadius: 0,
                hasShadow: false,
                joinsAllSpaces: true,
                ignoresMouseEvents: true
            )
        )
    ]
}
