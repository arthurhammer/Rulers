import XCTest
@testable import Rulers

class SizePropertyListRepresentableTests: XCTestCase {

    func test_KeysAreCorrect() {
        let size = CGSize(width: 5, height: .screen)
        let plist = size.propertyListValue

        let keys = Set(plist.keys)
        let expected = Set(["width", "height"])

        XCTAssertEqual(keys, expected)
    }

    func test_ExampleSerialization() {
        let size = CGSize(width: .screen, height: 50.3)

        let plist = size.propertyListValue
        let expected = ["width": CGFloat.screen, "height": 50.3]

        XCTAssertTrue(equal(plist, expected))
    }

    func test_AcceptsIntsWhenUnserializing() {
        let plist = ["width": Int(5), "height": Int(0)]

        let size = CGSize(propertyList: plist)
        let expected = CGSize(width: 5, height: 0)

        XCTAssertEqual(size, expected)
    }

    func test_AcceptsMixedTypesWhenUnserializing() {
        let plist: PropertyList = ["width": Int(5), "height": Float(2.5)]

        let size = CGSize(propertyList: plist)
        let expected = CGSize(width: 5, height: 2.5)

        XCTAssertEqual(size, expected)
    }

    func test_AdditionalKeysAreIgnoredWhenUnserializing() {
        let plist: PropertyList = ["width": 5.0, "height": 0, "dummy": "dummy"]

        let size = CGSize(propertyList: plist)
        let expected = CGSize(width: 5, height: 0)

        XCTAssertEqual(size, expected)
    }

    func test_MissingValuesUnserializeToZero() {
        // Height missing
        var size = CGSize(propertyList: ["width": 5.0])
        var expected = CGSize(width: 5.0, height: 0)
        XCTAssertEqual(size, expected)

        // Width missing
        size = CGSize(propertyList: ["height": 10.0])
        expected = CGSize(width: 0, height: 10)
        XCTAssertEqual(size, expected)

        // Both missing
        size = CGSize(propertyList: [:])
        expected = CGSize.zero
        XCTAssertEqual(size, expected)
    }

    func test_SerializingAndUnserializingToDataRestoresValue() {
        let size = CGSize(width: .screen, height: 10.1)
        let plist = size.propertyListValue

        let unarchived = plist.archived().unarchived()

        guard let unarchivedPlist = unarchived as? PropertyList else {
            return XCTFail()
        }

        let unarchivedSize = CGSize(propertyList: unarchivedPlist)

        XCTAssertTrue(equal(unarchivedPlist, plist))
        XCTAssertEqual(unarchivedSize, size)
    }
}

