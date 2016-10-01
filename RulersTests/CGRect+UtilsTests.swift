import XCTest

class CGRectUtilsTests: XCTestCase {

    // MARK: - Centering Rects

    func test_CenteringRect() {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        let center = CGPoint(x: 2, y: 2)

        let out = rect.centered(at: center)
        let expected = CGRect(x: 1.5, y: 1.5, width: 1, height: 1)

        XCTAssertEqual(out, expected)
        XCTAssertEqual(out.center, center)
    }

    // MARK: - Clamping Rects

    func test_ClampingToInfiniteDoesNothing() {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        let out = rect.clamped(to: .infinite)

        XCTAssertEqual(out, rect)
    }

    func test_ClampedIsContainedInClamping() {
        let rect = CGRect(x: -10, y: -20, width: 4, height: 4)
        let clamping = CGRect(x: 0, y: 0, width: 1, height: 1)

        let out = rect.clamped(to: clamping)

        XCTAssertTrue(clamping.contains(out))
    }

    func test_BiggerClampedEqualsClamping() {
        let rect = CGRect(x: -10, y: -20, width: 4, height: 4)
        let clamping = CGRect(x: 0, y: 0, width: 1, height: 1)

        let out = rect.clamped(to: clamping)

        XCTAssertEqual(out, clamping)
    }

    func test_SmallerNonContainedClampedIsMovedButNotResized() {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        let clamping = CGRect(x: 1, y: 1, width: 2, height: 2)

        let out = rect.clamped(to: clamping)

        XCTAssertNotEqual(out.origin, rect.origin)
        XCTAssertEqual(out.size, rect.size)
        XCTAssertTrue(clamping.contains(out))
    }

    func test_ContainedClampedIsLeftAlone() {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        let clamping = CGRect(x: -1, y: -1, width: 10, height: 10)

        let out = rect.clamped(to: clamping)

        XCTAssertEqual(out, rect)
        XCTAssertTrue(clamping.contains(out))
    }

    func test_ClampingFromSpecificDirectionsMovesClampedToTheCorrectEdge() {
        let clamping = CGRect(x: 0, y: 0, width: 3, height: 3)

        let left = CGRect(x: -5, y: 1, width: 1, height: 1)
        let right = CGRect(x: 5, y: 1, width: 1, height: 1)
        let below = CGRect(x: 1, y: -5, width: 1, height: 1)
        let above = CGRect(x: 1, y: 5, width: 1, height: 1)

        let outLeft = left.clamped(to: clamping)
        let outRight = right.clamped(to: clamping)
        let outBelow = below.clamped(to: clamping)
        let outAbove = above.clamped(to: clamping)

        XCTAssertTrue(clamping.contains(outLeft))
        XCTAssertEqual(outLeft.x, clamping.x)
        XCTAssertNotEqual(outLeft.y, clamping.y)

        XCTAssertTrue(clamping.contains(outRight))
        XCTAssertEqual(outRight.maxX, clamping.maxX)
        XCTAssertNotEqual(outRight.y, clamping.y)

        XCTAssertTrue(clamping.contains(outBelow))
        XCTAssertEqual(outBelow.y, clamping.y)
        XCTAssertNotEqual(outBelow.x, clamping.x)

        XCTAssertTrue(clamping.contains(outAbove))
        XCTAssertEqual(outAbove.maxY, clamping.maxY)
        XCTAssertNotEqual(outAbove.x, clamping.x)
    }
}
