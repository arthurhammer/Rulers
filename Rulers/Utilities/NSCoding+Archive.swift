import Foundation

extension NSCoding {
    func archived() -> Data {
        return NSKeyedArchiver.archivedData(withRootObject: self)
    }

    static func unarchived(data: Data) -> Self? {
        return NSKeyedUnarchiver.unarchiveObject(with: data) as? Self
    }
}
