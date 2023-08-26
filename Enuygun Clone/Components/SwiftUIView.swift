import SwiftUI

struct CustomVStack<Content: View> : View {
    var content: () -> Content
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    
    var body: some View {
        VStack {
            content()
        }
    }
}

struct CustomHStack<Content: View> : View {
    var content: () -> Content
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    
    var body: some View {
        HStack {
            content()
        }
    }
}

extension Mirror {
    static var i = 0
    static func getChildren<T> (of target: Any, parent: String = "Root") -> [AnyView] where T: View {
        let mirror = Mirror(reflecting: target)
        var children: [AnyView] = []
        var recursively = true
        
        for child in mirror.children {
            if let label = child.label, label == "value" {
                children.append(AnyView((child.value as? T) ?? AnyView(Text("amlieal"))))
//                children.append((child.value as? AnyView) ??  AnyView(Text("\(String(describing: child.value))")))
//                recursively = false
            } else if String(describing: child.value).starts(with: "ForEach") {
                print("For each e girdi")
                continue
            } else if recursively {
//                if child.value is AnyView {
                    var _ = print("START \(parent)")
                print("Child: \(child.value)")
                children.append(contentsOf: getChildren(of: child.value, parent: child.label ?? "NO LABEL"))
                    var _ = print("END \(parent)")
//                }
            }
        }
        
        return children
    }
}

extension Mirror {
    static func reflectProperties<T>(
        parent: String = "Root",
        of target: Any,
        matchingType type: T.Type = T.self,
        recursively: Bool = false,
        using closure: (String, String?, T) -> Void
    ) {
        let mirror = Mirror(reflecting: target)
        for child in mirror.children {
            if (child.value is T){
                closure(parent, child.label, child.value as! T)
            }
            
            if recursively{
                Mirror.reflectProperties(
                    parent: child.label ?? "NO LABEL",
                    of: child.value,
                    recursively: true,
                    using: closure
                )
            }
        }
    }
}

enum SpacerMode {
    case spaceBetween
    case spaceAround
    case spaceEvenly
}

extension VStack {
    @ViewBuilder
    func spacer(_ spacerMode: SpacerMode) -> some View {
        var children: [AnyView] = []
        var _ = Mirror.reflectProperties(of: self, recursively: true) { (parent, label, child: (any View)) in
            print("Parent: \(parent) - Label: \(label ?? "NO LABEL") - Child: \(String(describing: child))")
            if parent == "value" {
                print("child: \(String(describing: child))")
                children.append(AnyView(child))
            }
        }
        
        CustomVStack{
                ForEach(children.indices, id: \.self) { index in
                    let child = children[index]
                        .border(.yellow)
                    
                    if spacerMode == .spaceBetween {
                        child
                        if index != children.count - 1 {
                            Spacer()
                        }
                    } else if spacerMode == .spaceAround {
                        Spacer()
                        child
                        Spacer()
                    } else if spacerMode == .spaceEvenly {
                        if index == 0 {
                            Spacer()
                        }
                        child
                        Spacer()
                    }
                }
        }
        .border(.red)
    }
}

extension HStack {
    @ViewBuilder
    func spacer(_ spacerMode: SpacerMode) -> some View {
//        var children: [AnyView] = []
//        var _ = Mirror.reflectProperties(of: self, recursively: true) { (parent, label, child: (any View)) in
//            print("Parent: \(parent) - Label: \(label ?? "NO LABEL") - Child: \(String(describing: child))")
//            if String(describing: child).starts(with:"ForEach") {
//
//            }
//            if parent == "value" {
//                print("child: \(String(describing: child))")
//                children.append(AnyView(child))
//            }
//        }
        let children = Mirror.getChildren(of: self)
        CustomHStack{
            ForEach(children.indices, id: \.self) { index in
                let child = children[index]
                    .border(.yellow)
                
                if spacerMode == .spaceBetween {
                    child
                    if index != children.count - 1 {
                        Spacer()
                    }
                } else if spacerMode == .spaceAround {
                    Spacer()
                    child
                    Spacer()
                } else if spacerMode == .spaceEvenly {
                    if index == 0 {
                        Spacer()
                    }
                    child
                    Spacer()
                }
            }
        }
        .border(.red)
    }
}

struct ContentView3: View {
    @State var state: SpacerMode = .spaceBetween
    var body: some View {
        VStack {
            HStack {
                Button("Space Between") {
                    state = .spaceBetween
                }
                Button("Space Around") {
                    state = .spaceAround
                }
                Button("Space Evenly") {
                    state = .spaceEvenly
                }
            }.spacer(.spaceAround)
                .padding(8)
            
            HStack {
                Text("Hello").border(.red)
                Text("World").border(.green)
                Text("World2").border(.green)
            }
            .spacer(state)
            .padding(8)
            
        }
    }
}

struct ContentView2_Previews: PreviewProvider {
    static var previews: some View {
        ContentView3()
    }
}
