import SwiftUI


struct ContentView: View {
    
    let popover = NSPopover()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
               
        .padding()
    }

}
