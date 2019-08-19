# GradientView
A swift UIView subclass that does gradients easily in the storyboard and in code. It can also animate the gradient for some cool effects.


## Installation
Import into your xcode project by downloading the file and draging it into your project. Make sure it's added to your project and then you're good to go.


## Non-Animating Usage
```swift

let gradientView: GradientView = GradientView() 

gradientView.startPoint = CGPoint(x: 0, y: 0)   //gradient will start in upper left corner
gradientView.endPoint = CGPoint(x: 1.0, y: 1.0)   //Will end in bottom right corner

gradientView.startColor = UIColor.blue  //upper left color will be blue
gradientView.endColor = UIColor.gray  //bottom right collor will be gray 

```


## Animating Usage

```swift

let gradientView: GradientView = GradientView() 

...  //other code

gradientView.animationDuration = 5.0   //duration (in seconds of animation)

```
