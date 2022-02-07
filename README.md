# UIKitSwiftUIDemo
> UIKitSwiftUI Demo App

Getting started with UIKit in SwiftUI 

SwiftUI can work together with UIKit by making it easier to add SwiftUI views to UIKit and visa versa using a few extensions shared in this repo. SwiftUI was introduced in iOS 13 at a time many of us have a big app built with UIKit. SwiftUI makes us enthusiastic just like when Swift was introduced to get started with this new framework for building apps.

When Swift was introduced we had to migrate from Objective-C to Swift. A lot of apps are most likely still using (partly) Objective-C as a transition can take quite some time. It’s good to know how to start the transition to make this process as short as possible. iOS 14 is released and you might consider dropping iOS 12 which allows you to write new views in SwiftUI. Therefore, [a blog post](https://www.avanderlee.com/swiftui/integrating-swiftui-with-uikit/#presenting-a-swiftui-view-in-a-uikit-view-controller) to explain how you can use SwiftUI within a UIKit application and existing UIKit views in SwiftUI.

# Adding a SwiftUI view to a UIKit view

Some basic Git commands are:
```swift
import UIKit
import SwiftUI

extension UIViewController {

    /// Add a SwiftUI `View` as a child of the input `UIView`.
    ///   - Parameters:
    ///   - swiftUIView: The SwiftUI `View` to add as a child.
    ///   - view: The `UIView` instance to which the view should be added.

    func addSubSwiftUIView<Content>(_ swiftUIView: Content, to view: UIView, constant: CGFloat = 0) where Content : View {

        let hostingController = UIHostingController(rootView: swiftUIView)

        // Add as a child of the current view controller.
        addChild(hostingController)

        // Add the SwiftUI view to the view controller view hierarchy.
        view.addSubview(hostingController.view)

        // Setup the contraints to update the SwiftUI view boundaries.
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            hostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
            hostingController.view.leftAnchor.constraint(equalTo: view.leftAnchor, constant: constant),
            view.bottomAnchor.constraint(equalTo: hostingController.view.bottomAnchor),
            view.rightAnchor.constraint(equalTo: hostingController.view.rightAnchor, constant: constant)
        ]

        NSLayoutConstraint.activate(constraints)

        // Notify the hosting controller that it has been moved to the current view controller.
        hostingController.didMove(toParent: self)
    }
}
```

# Creating an extension to simplify adding SwiftUI views

To make this more efficient we can wrap this logic inside an extension on UIViewController. It allows us to write the same code as above as follows:

```swift
func addSwiftUIView() {
    let swiftUIView = SwiftUIView()
    addSubSwiftUIView(swiftUIView, to: view)
}
```

# The benefits of using SwiftUI as soon as possible in a UIKit app
Transitioning from a UIKit app to SwiftUI is time-consuming and will probably take years for larger apps. Apps written in Objective-C had to take the same transition when Swift was introduced and are likely still not completely moved over. Therefore, adopting SwiftUI early on comes with a few benefits:

- No need to rewrite your new views in the future to SwiftUI
- You start learning SwiftUI while developing as you normally do
- The transition to SwiftUI takes time. The earlier you start, the earlier your app will be completely written in SwiftUI

# Things to consider when adopting SwiftUI in a UIKit application
It’s important to know that you can only use SwiftUI on iOS 13 and up. On top of that, SwiftUI is a new technology that has been improved in later updates. Dropping iOS 12 means you can start with SwiftUI but it also means that you start using the first version of SwiftUI. This could lead to unexpected behaviour and bugs from the early days.

# Using SwiftUI for new features only
Regarding this matter you could decide to use SwiftUI for new features only. This scenario is possible even if you’re not dropping iOS 12. You will use the availability APIs which makes your newly written views available only on the versions that support SwiftUI.

```swift
if #available(iOS 13.0, *) {
    presentSwiftUIView()
} else {
    // Fallback on earlier versions
}
```

You can decide to deliver new features with SwiftUI which makes that code future proof as it takes away the need to rewrite it in a few years. This obviously only works if you can decide to make a certain feature only available to users on iOS 13 and up.

# Conclusion
Adding SwiftUI views in a UIKit application early on makes your future self a lot happier as you don’t have to rewrite it later on again. With a simple `UIViewController` extension method you can easily add a view in a few lines of code. Decide whether or not you can build a new feature with SwiftUI and make use of the `UIHostingController` to present SwiftUI views.

# Screenshots

|<img src="https://github.com/obadasemary/UIKitSwiftUIDemo/blob/main/Screenshots/UIKitSwiftUIDemo00.png" alt="HTML5 Icon" width="300" height="598">|<img src="https://github.com/obadasemary/UIKitSwiftUIDemo/blob/main/Screenshots/UIKitSwiftUIDemo01.png" alt="HTML5 Icon" width="300" height="598">|<img src="https://github.com/obadasemary/UIKitSwiftUIDemo/blob/main/Screenshots/UIKitSwiftUIDemo02.png" alt="HTML5 Icon" width="300" height="598">|
| :---: | :---: | :---: |
|<img src="https://github.com/obadasemary/UIKitSwiftUIDemo/blob/main/Screenshots/UIKitSwiftUIDemo03.png" alt="HTML5 Icon" width="300" height="598">|<img src="https://github.com/obadasemary/UIKitSwiftUIDemo/blob/main/Screenshots/UIKitSwiftUIDemo04.png" alt="HTML5 Icon" width="300" height="598">|<img src="https://github.com/obadasemary/UIKitSwiftUIDemo/blob/main/Screenshots/UIKitSwiftUIDemo05.png" alt="HTML5 Icon" width="300" height="598">|

If you like to read the original source of this article, check out the [Getting started with UIKit in SwiftUI](https://www.avanderlee.com/swiftui/integrating-swiftui-with-uikit/) by [Antoine v.d.](https://twitter.com/twannl) [SwiftLee ](https://www.avanderlee.com). Feel free to contact me or tweet to me on [Twitter](https://twitter.com/obadasemary) if you have any additional tips or feedback.

Thanks!
