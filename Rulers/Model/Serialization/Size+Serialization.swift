import Foundation

extension Size: PropertyListSerializable {
    var propertyListValue: PropertyList {
        return [
            "width": width ?? "nil",
            "height": height ?? "nil"
        ]
    }

    init?(propertyList: PropertyList) {
        let p = propertyList
        let width = p["width"] as? Double
        let height = p["width"] as? Double
        self = Size(width: width, height: height)
    }
}
