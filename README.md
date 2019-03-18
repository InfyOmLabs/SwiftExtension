# SwiftExtension

[![CI Status](http://img.shields.io/travis/dhvl-golakiya/SwiftExtension.svg?style=flat)](https://travis-ci.org/dhvl-golakiya/SwiftExtension)
[![Version](https://img.shields.io/cocoapods/v/SwiftExtension.svg?style=flat)](http://cocoapods.org/pods/SwiftExtension)
[![License](https://img.shields.io/cocoapods/l/SwiftExtension.svg?style=flat)](http://cocoapods.org/pods/SwiftExtension)
[![Platform](https://img.shields.io/cocoapods/p/SwiftExtension.svg?style=flat)](http://cocoapods.org/pods/SwiftExtension)

Simple Swift extensions for classes which are mostly used in iOS apps.

## Requirements
Required Swift 4.0 or later

## Installation

### Install Manually
Download and drop Classes folder to your project

### Install via CocoaPods
SwiftExtension is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "SwiftExtension"
```
Import `SwiftExtension` to your class

``` swift
import UIKit
import SwiftExtension
```

##Array extension

Make Comma separated String from array
``` swift
var myArray = ["New York", "London", "Paris"]
myArray.toCommaString // New York,London,Paris
```

Remove Specific object from Array
``` swift
var myArray = ["New York", "London", "Paris"]
myArray.removeObject("London") // ["New York", "Paris"]
```

Chack Array contain specific object
``` swift
var myArray = ["New York", "London", "Paris"]
myArray.containsObject("London") // true
myArray.containsObject("Seattle") // false
```

Get Index of specific object
``` swift
var myArray = ["New York", "London", "Paris"]
myArray.indexOfObject("Paris") // 2
```

Gets the object at the specified index, if it exists.
``` swift
var myArray = ["New York", "London", "Paris"]
myArray.get(1) // London
```

## Int Extension
``` swift
let number = 10
print(number.isOdd) // false
print(number.isEven) // true
print(number.isNegative) // false
print(number.isPositive) // true
print(number.toUInt) // 10
print(number.toFloat)// 10.0
print(number.toInt64) // 10
print(number.toDouble) // 10.0
print(number.toString) // 10
print(number.toCGFloat) // 10.0
print(number.digit()) // [1, 0]
print(number.digitCount) // 2
print(number.factorial()) // 3628800
```

## NSData Extension

``` swift
let data = NSData()
data.toDictionary // Convert NSData to NSDictionary
data.toJsonString // Convert NSData to NSString
```

## NSMutableData Extension
``` swift
let data = NSMutableData()
data.appendString("String") // Convert String to NSdata then append to NSMutableData
```

## NSDate Extension
``` swift
let date = Date()
let afterDate = Date(timeIntervalSinceNow: 253333)
print(date.weekDay) // 2 : Get Week day from date
print(date.weekOfMonth)// : Get Week index of month from date
print(date.weekDayName) // Monday : Get Week day name from date
print(date.monthName) // April  : Get Month name from date
print(date.month) // 4  : Get Month index from date
print(date.day) // 4  : Get Day index from date
print(date.year) // 2016  : Get Year index from date
print(date.getHourAndMinute()) // (19, 43)  : Get Hour and Minute from date
print(date.weekDaysInMonth()) // 4  : Get Total count of weeks in month from date
print(date.weeksInMonth()) // 4 : Get Total count of week days in month from date
print(date.daysInMonth()) // 30 : Get Total count of days in month from date
print(date.getTime()) // 07:43 PM : Get Time in AM / PM format
print(date.getTimeInShortFormat()) // 04 Apr  : Get Time short (i.e 12 Mar) format
print(date.getTimeInFullFormat()) // 04 Apr, 2016 :Get Time short (i.e 12 Mar, 2016) format
print(date.formateBirthDate()) // 2016-04-04  : Get Time standard (i.e 2016-03-12) format
print(date.afterDate(afterDate)) // true  : Check date is after date
print(date.beforDate(afterDate)) // false : Check date is before date
print(date.equalDate(afterDate)) // false : Check date is equal date
print(date.daysInBetweenDate(afterDate)) // 2 : Get days difference between dates
print(date.hoursInBetweenDate(afterDate)) // 70 : Get hours difference between dates
print(date.minutesInBetweenDate(afterDate)) // 4222 : Get minutes difference between dates
print(date.secondsInBetweenDate(afterDate)) // 253333 : Get seconds difference between dates
print(afterDate.getDifferenceBetweenDates()) // 2 days : 22h : 22m : 22s : Get time difference between date from today
```
## NSDictionary Extension
``` swift
let dictionary = NSDictionary(objects: ["value1", "value2"], forKeys: ["key", "secondKey"])
print(dictionary.has("key"))  //  true
print(dictionary.has("firstKey")) //  false
dictionary.toNSData // Convert NSDictionary to NSDate
 ```
 
## String Extension

General extensions
``` swift
let testString = "Simple Swift extensions ,for classes which are mostly used in iOS apps"
print(testString.trim())  // SimpleSwiftextensions,forclasseswhicharemostlyusediniOSapps
print(testString.length)  //  70
print(testString.makeArray) //  ["Simple Swift extensions ","for classes which are mostly used in iOS apps" ]
print(testString.makeArrayByWhiteSpace) //  [ Simple, Swift, extensions,",for", classes, which, are, mostly, used, in, iOS, apps ]
print(testString[5])  //  e
print(testString[5 ..< 15]) // e Swift ex
print(testString.stringSizeWith(UIFont.systemFontOfSize(16), width: 200, lineSpecing: 5)) //  (0.0, 0.0, 183.0390625, 91.375)
print(testString.stringWidth(UIFont.systemFontOfSize(16)))  //  510.4140625
print(testString.removeCharsFromEnd(15))  //  Simple Swift extensions ,for classes which are mostly u
print(testString.contains("extensions"))  //  true
print(testString.contains("Extensions"))  //  false
print(testString.containsIgnoreCase("extensions"))  //  true  

let testStringNew = "Simple Swift extensions for classes \nwhich are mostly used in iOS apps"
print(testStringNew.trimForNewLineCharacterSet()) //  Simple Swift extensions for classes  which are mostly used in iOS apps
```

Get Youtube video Id from Youtube url
``` swift
let youtubeUrl = "https://www.youtube.com/watch?v=0wIiDnjz4X4"
print(youtubeUrl.getYoutubeID())  //  0wIiDnjz4X4
```

Get Phone number string from Phone numner
``` swift
let phoneNumberStriing = "+91 22222-22222"
print(phoneNumberStriing.trimPhoneNumberString()) //  912222222222
```

String to Date
``` swift
let dateString = "1995-12-15"
print(dateString.getDate()) //  1995-12-14 18:30:00 +0000

let dateAndTimeString = "2016-04-05 12:12:10"
print(dateAndTimeString.getDateAndTime()) //  2016-04-05 06:42:10 +0000
```
String to NSDictionary and NSDate
``` swift
let jsonString
print(jsonString.toDictionary)  //  Convert String to NSDicationry
print(jsonString.toNSData())    //  Convert String to NSdate
```
Check string contain Regex (Regular expresion)
``` swift
let imageUrl = http://www.testing.com/uploads/images/__w-200-400-600-800-1000__/9fbaa5bc4e032fb528f3f41997f660e7.jpg
print(imageUrl.matchesForRegexInText("__w-((?:-?\\d+)+)__")) // Get only image size string array ["__w-200-400-600-800-1000__"]
```
Path Component and Extensions
``` swift
let pathString = "file.png" //  
print(pathString.lastPathComponent) //  file.png
print(pathString.pathExtension) //  png
print(pathString.stringByDeletingPathExtension) //  file
print(pathString.stringByDeletingLastPathComponent) //  ""
print(pathString.pathComponents)  //  ["file.png"]
print(pathString.stringByAppendingPathComponent("jpeg"))  //  file.png/jpeg
print(pathString.stringByAppendingPathExtension("files")) //  file.png.files
print(pathString.insertSubString(2, "new testing")) //  finew testingle.png
```

String to number
``` swift
let numberString = "44"
print(numberString.toDouble())  //  44.0
print(numberString.toFloat()) //  44.0
print(numberString.toUInt())  //  44
print(numberString.toBool())  //  true
```

Email validation
``` swift
let emailString = "dhvl.golakiya@gmail.com"
let emailStringNew = "dhvl@golakiya@gmail.com"
print(emailString.isEmail)  //  true
print(emailStringNew.isEmail) //  false
```

URL validation
``` swift
let urlString = "www.google.com"
let urlStriongNew = "www."
print(urlString.isValideUrl)  //  true
print(urlStriongNew.isValideUrl)  //  false
```

## UIButton Extension
``` swift
let button = UIButton()
button.applyCornerRadius(true)  //  Make button round
button.setBackgroundColor(UIColor.greenColor(), forState: .Selected)  //  Set background color green for selected state
button.textForAllState("Done")  //  Set title label text "Done" for all state
button.textForNormal("Done")  //  Set title label text "Done" for normal state
button.textForSelected("Done")  //  Set title label text "Done" for selected state
button.textForHighlighted("Done")  //  Set title label text "Done" for highlighted state
button.imageForAllState(UIImage(named: "done")!)  //  Set "done" image for all state
button.imageForNormal(UIImage(named: "done")!)  //  Set "done" image for normal state
button.imageForSelected(UIImage(named: "done")!)  //  Set "done" image for selected state
button.imageForHighlighted(UIImage(named: "done")!) //  Set "done" image for highlighted state
button.colorOfTitleLabelForAllState(UIColor.grayColor()) //  Set title label color grey for all state
button.colorOfTitleLabelForNormal(UIColor.grayColor()) //  Set title label color grey for normal state
button.colorOfTitleLabelForSelected(UIColor.grayColor()) // Set title label color grey for selected state
button.colorOfTitleLabelForHighlighted(UIColor.grayColor()) //  Set title label color grey for highlighted state
button.setImageBehindTextWithCenterAlignment(15, buttonWidth: 100, space: 2)  //  Set image behind text in Center alignment
button.setImageOnRightAndTitleOnLeft(15, buttonWidth: 100)  //  Set image right side and text on left side
button.setImageBehindTextWithLeftAlignment(15, buttonWidth: 100)  //  Set image behind text in left alignment
```

## UIColor Extension
``` swift
UIColor(hex: 222222, alpha: 1.0)  // Return UIColor from hext
UIColor(hexString: "222222")  //  Return UIcolor from hex string
UIColor(hexString: "222222", alpha: 1.0)  //  Return UIColor from hext string with alpha value
```

## UIFont Extension
``` swift
UIFont(fontname: "Custom Font", fontSize: 16) //  Return Custom font with font size
```

## UIImage Extension
``` swift
let image = UIImage(named : "test")
image.colorizeImage(UIColor.blackColor) // Return black color image from this image
image.tintedImage() //  Return tinted image from this image
image.croppedImage()  //  Return cropped image 
image.rotateImageToNighntyDegree() // Return 90 degree rotated image
```

## UILabel Extension
``` swift
let label = UILabel()
label.getEstimatedSize(320, height: 100)  //  Return estimated size of label
label.getEstimatedHeight()  //  Return estimated height of label
label.getEstimatedWidth() //  Return estimated width of label
label.fitHeight() //  Fit label height
label.fitWidth()  //  Fit label width
label.fitSize() //  Fit label size
label.getLinesArrayOfString() // Get line text in string array
label.getLinesArrayOfString(2)  //  Get nth line text
```

## UIViewController
Used for tracking screen for app analysis using `event_viewDidLoad` method which screen shown
``` swift
self.className() // Viewcontroller class name
```

## UIView Extension
``` swift
let view = UIView()
print(view.endX)  //  Get view.frame.size.width + view.frame.origin.x
print(view.endY)  //  Get view.frame.size.height + view.frame.origin.y
print(view.startX) //  Get view.frame.origin.x
print(view.startY)  //  Get view.frame.origin.y
print(view.getWidth)  // Get view's width
print(view.getHeight) //Get view's height
view.setStartX(10)  //  Set view origin.x to 10
view.setStartY(100) //  Set view origin.y to 100
view.setWidth(150)  //  Set view width 150
view.setHeight(200) //  Set view height 200
view.setCenter(75, y: 75) //  Set vew center to (75,75)
print(view.getCenter()) //  Get view center
view.setCenterX(75) //  Set view center.x to 75
print(view.getCenterX())  //  Get view center.x
view.setCenterY(75) //  Set view center.y to 75
print(view.getCenterY())  //  Get view center.y
print(view.parentViewController) // Get view's parent view controller
print(view.applyPlainShadow()) // Apply plain shadow
print(view.applyBorder()) //  Apply border
view.applyCornerRadius(10, mask: true)  //  Apply corner radius with mask endble / disable
view.addTopBorderWithColor(UIColor.redColor(), width: 2)  //  Add top border
view.addRightBorderWithColor(UIColor.redColor(), width: 2)  //  Add right border
view.addBottomBorderWithColor(UIColor.redColor(), width: 2) //  Add bottom border
view.addLeftBorderWithColor(UIColor.redColor(), width: 2) //  Add left border
```

## Author
dhvl-golakiya, dhvl.golakiya@gmail.com

## License

SwiftExtension is available under the MIT license. See the LICENSE file for more info.
