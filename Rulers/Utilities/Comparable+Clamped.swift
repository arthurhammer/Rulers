import Foundation

extension Comparable {

    func clamped(lower: Self, upper: Self) -> Self {
        assert(lower <= upper)
        return min(upper, max(lower, self))
    }

    func clamped(to range: ClosedRange<Self>) -> Self {
        return clamped(lower: range.lowerBound, upper: range.upperBound)
    }
}
