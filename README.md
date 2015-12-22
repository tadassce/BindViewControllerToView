# BindViewControllerToView

[![Version](https://img.shields.io/cocoapods/v/BindViewControllerToView.svg?style=flat)](http://cocoapods.org/pods/BindViewControllerToView)
[![License](https://img.shields.io/cocoapods/l/BindViewControllerToView.svg?style=flat)](http://cocoapods.org/pods/BindViewControllerToView)
[![Platform](https://img.shields.io/cocoapods/p/BindViewControllerToView.svg?style=flat)](http://cocoapods.org/pods/BindViewControllerToView)

Easily embed any ViewController and its respective ViewModel in a Collection/Table View Cell.

## Basic Usage
To take advantage of this library there are a few steps that you need to follow:

### CollectionViewController

Start by registering the cell parametrized with the ViewController that you want to present.

```swift
override func viewDidLoad() {
		super.viewDidLoad()
		
		// Register cell classes
		self.collectionView!.registerClass(ViewControllerCollectionCell<ViewController>.self, forCellWithReuseIdentifier: reuseIdentifier)
	}
```

Then bind a ViewModel to the ViewController provided.

```swift
	override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath)

		if let cell = cell as? MyCollectionCell {
			cell.bind(toViewModel: viewModelCollection.viewModels[indexPath.item])
		}

		return cell
	}
```


### ViewController
On the ViewController you need to implement the BindableViewController protocol.

```swift
extension ViewController: BindableViewController {

	static func initViewController() -> BindableViewController {
		let storyboard = UIStoryboard(name: "Main", bundle: nil)
		let vc = storyboard.instantiateViewControllerWithIdentifier("ViewC") as! ViewController
		return vc
	}

	func bind(viewModel viewModel: BindableViewModel) {
		guard let viewModel = viewModel as? ViewModel else {
			return
		}

		self.viewModel = viewModel
	}
	
}
```

### ViewModel

```swift
struct ViewModel: BindableViewModel {
	var helloWorld = "Hello World!"
}
````

## Customization

To provide a custom cell and change how the ViewController's view is bound to the cell subclass ```ViewControllerCollectionCell<T>``` and implement ```func bind(viewControllerType type: BindableViewController.Type, toView view: UIView)```.

```swift 

class MyCollectionCell: ViewControllerCollectionCell<ViewController> {
	override func bind(viewControllerType type: BindableViewController.Type, toView view: UIView) -> UIViewController? {
		//implement me
	}
}
```


## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

BindViewControllerToView is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "BindViewControllerToView"
```

## Author

Francisco Gonçalves, @franciscocsg

## License

BindViewControllerToView is available under the MIT license. See the LICENSE file for more info.
