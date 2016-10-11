import Foundation

/// A property list object must be of kind NSData, NSString, 
/// NSNumber, NSDate, NSArray, NSDictionary or their bridged
/// counterparts in Swift.
/// Container objects must also contain only these kinds of objects.
typealias PropertyList = [String: Any]


protocol PropertyListRepresentable {
    var propertyListValue: PropertyList { get }
    init?(propertyList: PropertyList)
}
