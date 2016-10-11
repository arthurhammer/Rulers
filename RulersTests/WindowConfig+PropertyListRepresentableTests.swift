import XCTest
@testable import Rulers

class WindowConfigPropertyListRepresentableTests {

    func test_SerializingAndUnserializingToDataRestoresValue() {
        let config = WindowConfig()
        let plist = config.propertyListValue

        let unarchived = plist.archived().unarchived()

        guard let unarchivedPlist = unarchived as? PropertyList else {
            return XCTFail()
        }

        let unarchivedConfig = WindowConfig(propertyList: unarchivedPlist)

        XCTAssertTrue(equal(unarchivedPlist, plist))
        XCTAssertEqual(unarchivedConfig, config)
    }

    // Possibly more tests...
}
