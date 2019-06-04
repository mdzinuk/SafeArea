# Safe Area Tutorial
In iOS 11 Apple has introduced the **safe area**, deprecated **topLayoutGuide** and **bottomLayout** properties from UIViewController. It is recommended to use safe area for placing controls within the container.

Sate area becomes clear when Apple introduce notch devices particularly from iPhone X. Our goal is do describe how to use safe area safely.

## Agenda
We will discuss about 
* UIView
* UIViewController
* UITableView

### UIView
```
@available(iOS 11.0, *)
open var safeAreaInsets: UIEdgeInsets { get }

@available(iOS 11.0, *)
open var safeAreaLayoutGuide: UILayoutGuide { get }
```
In iOS 11.0 Apple introduced these two properties `safeAreaInsets and safeAreaLayoutGuide` to protect control from all around the sides, basically The iPhone X has the top and the bottom safe area insets in portrait orientation. Left, right and bottom insets in landscape orientation.

| Unsafe Area portrait | Unsafe Area Landscape left| Unsafe Area Landscape right|
|----------|---------|---------|
| ![Unsafe portrait](https://github.com/mdzinuk/SafeArea/blob/master/Resources/unsafe-uiview-portrait.png)         | ![Unsafe landscape left](https://github.com/mdzinuk/SafeArea/blob/master/Resources/unsafe-uiview-landscape-left.png)        |  ![Unsafe landscape right](https://github.com/mdzinuk/SafeArea/blob/master/Resources/unsafe-uiview-landscape-right.png)       |

So, enabling safe area from storyboard and constants to safe area inset will fix the issues for UIView

| adding constant | Safe area portrait | Safe Area Landscape left| Safe Area Landscape right|
|----------|---------|---------|---------|
| ![Constant added](https://github.com/mdzinuk/SafeArea/blob/master/Resources/turnon%20safe%20area.png)         | ![Safe port](https://github.com/mdzinuk/SafeArea/blob/master/Resources/safe-uiview-portrait.png)        |  ![Safe landscape left](https://github.com/mdzinuk/SafeArea/blob/master/Resources/safe-uiview-landscape-left.png)       |  ![Safe landscape right](https://github.com/mdzinuk/SafeArea/blob/master/Resources/safe-uiview-landscape-right.png)       |

or using auto layout:

```
label1.translatesAutoresizingMaskIntoConstraints =  false
label2.translatesAutoresizingMaskIntoConstraints = false
NSLayoutConstraint.activate([
     label1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
     label1.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
     label1.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
     label2.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
     label2.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
     label2.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
])
```
> For our example we've to reset all constants first 

### UIViewController
In iOS 11 UIViewController has a new property with func:
```
@available(iOS 11.0, *)
open var additionalSafeAreaInsets: UIEdgeInsets

open func safeAreaInsetsDidChange()
open func viewSafeAreaInsetsDidChange()
```
These two methods are call When additional safe area insets or safe area insets are changed by the system.

AdditionalSafeAreaInsets insets can be used to add extra padding over the safe areas.
```
additionalSafeAreaInsets.top = 20.0
additionalSafeAreaInsets.left = 16.0
additionalSafeAreaInsets.bottom = 20.0
additionalSafeAreaInsets.right = 16.0
```
| Safe UIViewController portrait | Safe UIViewController landscape|
|----------|---------|
| ![Safe portrait](https://github.com/mdzinuk/SafeArea/blob/master/Resources/safe-uiviewcontroller-portrait.png)         | ![Safe landscape](https://github.com/mdzinuk/SafeArea/blob/master/Resources/safe-uiviewcontroller-right.png)        |

### UITableView
A yellow table-header with a label and some default cells are added to the the table.The header and the cells content view frame is changed in landscape orientation but the cell and the separator frames aren’t changed. It’s a default behavior which can be managed by the new UITableView’s insetsContentViewsToSafeArea property:

```
@available(iOS 11.0, *)
open var insetsContentViewsToSafeArea: Bool
```
| Safe UITableView portrait | Safe UITableView landscape|
|----------|---------|
| ![Safe portrait](https://github.com/mdzinuk/SafeArea/blob/master/Resources/safe-uivtablecontroller-portrait.png)         | ![Safe landscape](https://github.com/mdzinuk/SafeArea/blob/master/Resources/safe-uivtablecontroller-landscape.png)        |

## Example
![Safe Area Demo](https://github.com/mdzinuk/SafeArea/blob/master/Resources/demo.gif)

`Xcode Version 10.2.1, Swift 5, Deployment Target 12.2`
