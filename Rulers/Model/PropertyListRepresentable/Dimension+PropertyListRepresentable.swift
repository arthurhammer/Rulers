import Foundation

extension CGSize: PropertyListRepresentable {
    var propertyListValue: PropertyList {
        return ["width": width, "height": height]
    }

    init(propertyList: PropertyList) {
        let p = propertyList

        // Bridge to `NSNumber` so we can accept numbers other than strict `CGFloat`s
        let w = p["width"] as? NSNumber ?? 0
        let h = p["height"] as? NSNumber ?? 0

        width = CGFloat(w.doubleValue)
        height = CGFloat(h.doubleValue)
    }
}


extension CGPoint: PropertyListRepresentable {
    var propertyListValue: PropertyList {
        return ["x": x, "y": y]
    }

    init(propertyList: PropertyList) {
        let p = propertyList

        let _x = p["x"] as? NSNumber ?? 0
        let _y = p["y"] as? NSNumber ?? 0

        x = CGFloat(_x.doubleValue)
        y = CGFloat(_y.doubleValue)
    }
}


// Note: We cannot fallback to `NSCoding` using `NSValue` since for some reason
// archiving infinite dimensions fails. See: http://stackoverflow.com/questions/17059941

