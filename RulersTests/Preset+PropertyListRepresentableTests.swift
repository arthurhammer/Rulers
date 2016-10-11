import XCTest

class PresetPropertyListRepresentableTests: XCTestCase {

    func test_SerializingAndUnserializingToDataRestoresValue() {
        let preset = Preset()
        let plist = preset.propertyListValue

        let unarchived = plist.archived().unarchived()

        guard let unarchivedPlist = unarchived as? PropertyList else {
            return XCTFail()
        }

        let unarchivedPreset = Preset(propertyList: unarchivedPlist)

        XCTAssertTrue(equal(unarchivedPlist, plist))
        XCTAssertEqual(unarchivedPreset, preset)
    }

    // Possibly more tests...
}
