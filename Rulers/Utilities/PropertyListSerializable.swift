import Foundation

/// A property list object must be of kind NSData, NSString, 
/// NSNumber, NSDate, NSArray, NSDictionary or their bridged
/// counterparts in Swift.
/// Container objects must also contain only these kinds of objects.
protocol PropertyListType {}
typealias PropertyList = [String: Any]


protocol PropertyListSerializable {
    var propertyListValue: PropertyList { get }
    init?(propertyList: PropertyList)
}


// (incomplete)
//extension Int: PropertyListType {}
//extension Double: PropertyListType {}
//extension Bool: PropertyListType {}
//extension String: PropertyListType {}
//extension Data: PropertyListType {}
//// Best we can do since we can't restrict generic contents
//// to `PropertyListType`.
//extension Array: PropertyListType {}
//extension Dictionary: PropertyListType {}
//
//extension NSNumber: PropertyListType {}
//extension NSString: PropertyListType {}
//extension NSData: PropertyListType {}
//extension NSArray: PropertyListType {}
//extension NSDictionary: PropertyListType {}
//
