<p align="center">
    <img src="https://github.com/pigfly/A_J_Dot_Loading_Indicator/blob/master/assets/logo.png?raw=true">
</p>

# A-J-Dot-Loading-Indicator

![Travis](https://img.shields.io/travis/USER/REPO.svg)
![Code](https://img.shields.io/badge/code-%E2%98%85%E2%98%85%E2%98%85%E2%98%85%E2%98%85-brightgreen.svg)
![Swift](https://img.shields.io/badge/Swift-%3E%3D%203.1-orange.svg)
![npm](https://img.shields.io/npm/l/express.svg)

A-J-Dot-Loading-Indicator is an drop-in solution for full screen image and video browser

## Features

- [x] No Dependency, 100% iOS Native
- [x] Support both iPad and iPhone family
- [x] Support device rotation
- [x] Non-intrusive integration
- [x] Full documentation
- [x] Easy to customise

## Requirements

- iOS 8.0+ / macOS 10.10+ / tvOS 9.0+ / watchOS 2.0+
- Xcode 8.3+
- Swift 3.1+

## Installation

- drag and drop the entire `core` folder into your project

## Full Usage Example

```swift
import UIKit

final class ViewController: UIViewController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        view.aj_showDotLoadingIndicator()
    }

    @IBAction func stop(_ sender: UIButton) {
        view.aj_hideDotLoadingIndicator()
    }
}
```

## Folder Structure

```shell
├── ViewController.swift
├── core
│   ├── AJDotLoadingView.swift
│   ├── AJDotLoadingView.xib
│   └── UIDotLoadingIndicator.swift
└── helper
    └── UIViewHelper.swift
```

| File                                 | Responsiblity                                                                        |
|--------------------------------------|--------------------------------------------------------------------------------------|
| ViewController                       | example view controller to show how to use `A-J-Dot-Loading-Indicator`               |
| UIViewHelper                         | helper `UIView` methods to refactor out common patterns                              |
| core/AJDotLoadingView                | wrapper view to include `UIDotLoadingIndicator` custom control                       |
| core/UIDotLoadingIndicator           | UI custom control for the dot loading indicator                                      |

## Demo

<p align="center">
    <img src="https://github.com/pigfly/A_J_Dot_Loading_Indicator/blob/master/assets/demo1.gif?raw=true">
</p>

<p align="center">
    <img src="https://github.com/pigfly/A_J_Dot_Loading_Indicator/blob/master/assets/demo2.gif?raw=true">
</p>

<p align="center">
    <img src="https://github.com/pigfly/A_J_Dot_Loading_Indicator/blob/master/assets/demo3.png?raw=true">
</p>

## Credits

A-J-Dot-Loading-Indicator is owned and maintained by the [Alex Jiang](https://pigfly.github.io). Thanks [iTMan.design](https://itman.design) for providing computational resources.

## License

A-J-Dot-Loading-Indicator is released under the MIT license.