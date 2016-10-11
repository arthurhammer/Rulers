import XCTest

class ComparableClampedTests: XCTestCase {

    func test_Clamping() {
        // Below
        XCTAssertEqual(-100.clamped(lower: -10, upper: 10), -10)
        // Above
        XCTAssertEqual(50.clamped(lower: -10, upper: 10), 10)
        // In-between
        XCTAssertEqual(2.clamped(lower: 0, upper: 5), 2)
        // Border
        XCTAssertEqual(0.clamped(lower: 0, upper: 5), 0)
        XCTAssertEqual(5.clamped(lower: 0, upper: 5), 5)
    }

    func test_ClampingWithDifferentTypes() {
        XCTAssertEqual(Float(5.1).clamped(lower: 6.0, upper: 100), 6.0)
        XCTAssertEqual("a".clamped(lower: "b", upper: "c"), "b")
    }

    func test_ClampingRanges() {
        XCTAssertEqual(0.clamped(to: 99...999), 99)
        XCTAssertEqual("e".clamped(to: "a"..."z"), "e")
    }
}
