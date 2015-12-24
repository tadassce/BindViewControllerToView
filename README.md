# BindViewControllerToView

[![Version](https://img.shields.io/cocoapods/v/BindViewControllerToView.svg?style=flat)](http://cocoapods.org/pods/BindViewControllerToView)
[![License](https://img.shields.io/cocoapods/l/BindViewControllerToView.svg?style=flat)](http://cocoapods.org/pods/BindViewControllerToView)
[![Platform](https://img.shields.io/cocoapods/p/BindViewControllerToView.svg?style=flat)](http://cocoapods.org/pods/BindViewControllerToView)

Easily embed any ViewController in a Collection/Table View Cell.

## Basic Usage
To take advantage of this library there are a few steps that you need to follow:


### CollectionViewCell
Start by creating a cell that extends from ViewControllerCollectionCell and parameterize it with the ViewController that you intend to present. 

```swift
class MyCollectionCell: ViewControllerCollectionCell<ViewController> {

  override func instantiateViewController() -> ViewController? {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let vc = storyboard.instantiateViewControllerWithIdentifier("ViewC") as! ViewController
    return vc
  }
}
```

### CollectionViewController

Then register your cell and you are good to go.

```swift
override func viewDidLoad() {
	super.viewDidLoad()
	
	// Register cell classes
	self.collectionView!.registerClass(MyCollectionCell.self, forCellWithReuseIdentifier: reuseIdentifier)
}
```

## Customization

As the main purpose of this library is to be used with UICollectionViewControllers or UITableViewControllers it provides already some base classes like ```ViewControllerCollectionCell``` and ```ViewControllerTableCell```. But it can be used to bind any view to any view controller by making the desired view implement the ```BindableView``` protocol.


## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

BindViewControllerToView is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "BindViewControllerToView"
```

## Author

Francisco Gonçalves, @franciscocsg

## License

BindViewControllerToView is available under the MIT license. See the LICENSE file for more info.
