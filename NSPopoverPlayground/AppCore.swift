import AppKit


class AppCore {
    
    static var shared = AppCore()
    
    var eventTapController: EventTapController!

    private init() {}
    
    
    func setUp() {
        setUpEventTap()
    }
        
    private func setUpEventTap() {
        guard eventTapController == nil else {
            CGEvent.tapEnable(tap: EventTapController.eventTap, enable: true)
            
            return
        }
        
        eventTapController = EventTapController()
    }
    
}
