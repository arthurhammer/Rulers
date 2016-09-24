//: [Previous](@previous)

// --- Clamping Rects Test ---

import Cocoa

extension Comparable {
    func clamped(lower: Self, upper: Self) -> Self {
        return min(upper, max(lower, self))
    }

    func clamped(to range: ClosedRange<Self>) -> Self {
        return clamped(lower: range.lowerBound, upper: range.upperBound)
    }
}


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

    func clamped(to rect: CGRect) -> CGRect {
        let r = rect.standardized
        let nw = width.clamped(to: 0...r.width)
        let nh = height.clamped(to: 0...r.height)
        let nx = x.clamped(to: r.minX...(r.maxX - nw))
        let ny = y.clamped(to: r.minY...(r.maxY - nh))

        return CGRect(x: nx, y: ny, width: nw, height: nh)
    }
}

func View(x: CGFloat = 0, y: CGFloat = 0, w: CGFloat, h: CGFloat, color: NSColor? = .lightGray) -> NSView {
    return View(frame: CGRect(x: x, y: y, width: w, height: h), color: color)
}

func View(frame: CGRect, color: NSColor? = .lightGray) -> NSView {
    let view = NSView(frame: frame)
    view.wantsLayer = true
    view.layer!.backgroundColor = color?.cgColor
    return view
}


let container = View(w: 600, h: 600)
let screen = View(x: 50, y: 50, w: 200, h: 200, color: .blue)
let ruler = View(x: 400, y: 400, w: 400, h: 100, color: .yellow)
let result = View(frame: ruler.frame.clamped(to: screen.frame), color: .red)

container.addSubview(screen)
container.addSubview(ruler)


container.addSubview(result)
















//: [Next](@next)
