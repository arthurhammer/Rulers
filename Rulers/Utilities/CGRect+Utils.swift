import Foundation

extension CGRect {

    var x: CGFloat {
        get { return origin.x }
        mutating set { origin.x = newValue }
    }
    var y: CGFloat {
        get { return origin.y }
        mutating set { origin.y = newValue }
    }
    var width: CGFloat {
        get { return size.width }
        mutating set { size.width = newValue }
    }
    var height: CGFloat {
        get { return size.height }
        mutating set { size.height = newValue }
    }

    var center: CGPoint {
        return CGPoint(x: midX, y: midY)
    }


    func centered(at point: CGPoint) -> CGRect {
        return CGRect(x: point.x - width/2, y: point.y - height/2, width: width, height: height)
    }

    func offset(by offset: CGPoint) -> CGRect {
        return offsetBy(dx: offset.x, dy: offset.y)
    }

    func clamped(to rect: CGRect) -> CGRect {
        let r = rect.standardized

        let nw = width.clamped(to: 0 ... r.width)
        let nh = height.clamped(to: 0 ... r.height)
        let nx = x.clamped(to: r.minX ... (r.maxX-nw))
        let ny = y.clamped(to: r.minY ... (r.maxY-nh))

        return CGRect(x: nx, y: ny, width: nw, height: nh)
    }
}
