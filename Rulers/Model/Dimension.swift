import Foundation

typealias Offset = CGPoint


enum Length {
    case max
    case fixed(Double)
}


struct Size {
    var width: Length
    var height: Length
    static var zero = Size(rawValue: .zero)
}


// MARK: - Extensions

extension Length: RawRepresentable {
    var rawValue: Double {
        switch self {
        case .max: return .infinity
        case .fixed(let value): return value
        }
    }

    init(rawValue: Double) {
        switch rawValue {
        case Double.infinity: self = .max
        default: self = .fixed(rawValue)
        }
    }
}


extension Length: ExpressibleByFloatLiteral, ExpressibleByIntegerLiteral {
    init(floatLiteral value: Double) {
        self.init(rawValue: value)
    }

    init(integerLiteral value: Int) {
        self.init(rawValue: Double(value))
    }
}


extension CGSize {
    init(width: Length, height: Length) {
        self.init(width: width.rawValue, height: height.rawValue)
    }
}

extension Size: RawRepresentable {
    var rawValue: CGSize {
        return CGSize(width: width, height: height)
    }

    init(rawValue: CGSize) {
        width  = Length(rawValue: Double(rawValue.width))
        height = Length(rawValue: Double(rawValue.height))
    }
}

