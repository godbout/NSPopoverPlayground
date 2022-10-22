import SwiftUI


struct EventTapController {

    static var window = NSWindow()
    static var popover = NSPopover()
    
    static var eventTap: CFMachPort!
    private var eventTapCallback: CGEventTapCallBack = { proxy, type, event, _ in
        
        
        
        print("mouse moved")
        
        
                
        return nil
    }
        
    init() {
        Self.eventTap = setUpEventTap()
        
        Self.popover.contentSize = NSSize(width: 200, height: 200)
        Self.popover.animates = true
        Self.popover.behavior = .semitransient
        Self.popover.contentViewController = NSViewController()
        Self.popover.contentViewController?.view = NSHostingView(rootView: ContentView())
        Self.window.setFrameOrigin(CGPoint(x: NSEvent.mouseLocation.x, y: NSEvent.mouseLocation.y))
        Self.window.orderFrontRegardless()

        Self.popover.show(relativeTo: NSZeroRect, of: Self.window.contentView!, preferredEdge: .maxY)
    }
        
    
    private func setUpEventTap() -> CFMachPort {
        let eventMask = (1 << CGEventType.mouseMoved.rawValue)
        guard let eventTap = CGEvent.tapCreate(tap: .cgAnnotatedSessionEventTap, place: .headInsertEventTap, options: .defaultTap, eventsOfInterest: CGEventMask(eventMask), callback: eventTapCallback, userInfo: nil) else { fatalError("big issue: can't create event tap") }
        
        let runLoopSource = CFMachPortCreateRunLoopSource(kCFAllocatorDefault, eventTap, 0)
        CFRunLoopAddSource(CFRunLoopGetCurrent(), runLoopSource, .commonModes)
        
        return eventTap
    }
}
