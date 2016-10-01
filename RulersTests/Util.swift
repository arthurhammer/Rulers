import Foundation

// Since property list values are `Any`, no equals operator is available
func equal(_ lhs: PropertyList, _ rhs: PropertyList) -> Bool {
    return (lhs as NSDictionary).isEqual(to: rhs)
}


extension Dictionary {
    func archived() -> Data {
        return NSKeyedArchiver.archivedData(withRootObject: self)
    }
}


extension Data {
    func unarchived() -> Any? {
        return NSKeyedUnarchiver.unarchiveObject(with: self)
    }
}
