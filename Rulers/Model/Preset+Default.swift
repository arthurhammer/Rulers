import Foundation

extension Preset {
    static let defaults = [
        Preset(
            name: NSLocalizedString("Default Preset", comment: "Name of default preset"),
            config: WindowConfig()
        ),
        Preset(
            name: NSLocalizedString("Reading Ruler", comment: "Name of reading ruler preset"),
            config: WindowConfig(
                size: Size(width: nil, height: 5),
                mouseOffset: .zero,
                canMoveOffscreen: false,
                color: .red,
                alpha: 1,
                cornerRadius: 0,
                hasShadow: true,
                joinsAllSpaces: true,
                ignoresMouseEvents: true)
        ),
        Preset(
            name: NSLocalizedString("Box", comment: "Name of box preset"),
            config: WindowConfig(
                size: Size(width: 600, height: 600),
                mouseOffset: .zero,
                canMoveOffscreen: true,
                color: .gray,
                alpha: 0.3,
                cornerRadius: 12,
                hasShadow: true,
                joinsAllSpaces: true,
                ignoresMouseEvents: true)
        )
    ]
}
