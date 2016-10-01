import Foundation

extension Preset: PropertyListRepresentable {

    var propertyListValue: PropertyList {
        return [
            "id": id,
            "name": name,
            "config": config.propertyListValue
        ]
    }

    init?(propertyList: PropertyList) {
        let p = propertyList

        guard
            let id = p["id"] as? String,
            let name = p["name"] as? String,
            let config = (p["config"] as? PropertyList).flatMap(WindowConfig.init(propertyList:))
        else {
            return nil
        }

        self = Preset(id: id, name: name, config: config)
    }
}
