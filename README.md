# SwiftExtension

[![CI Status](http://img.shields.io/travis/dhvl-golakiya/SwiftExtension.svg?style=flat)](https://travis-ci.org/dhvl-golakiya/SwiftExtension)
[![Version](https://img.shields.io/cocoapods/v/SwiftExtension.svg?style=flat)](http://cocoapods.org/pods/SwiftExtension)
[![License](https://img.shields.io/cocoapods/l/SwiftExtension.svg?style=flat)](http://cocoapods.org/pods/SwiftExtension)
[![Platform](https://img.shields.io/cocoapods/p/SwiftExtension.svg?style=flat)](http://cocoapods.org/pods/SwiftExtension)

Simple Swift extensions for classes which are mostly used in iOS apps.

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

## NSMutableData
``` swift
let data = NSMutableData()
data.appendString("String") // Convert String to NSdata then append to NSMutableData
```

## NSDate
``` swift
let date = NSDate()
let afterDate = NSDate(timeIntervalSinceNow: 253333)
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
## NSDictionary

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

SwiftExtension is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "SwiftExtension"
```

## Author

dhvl-golakiya, dhvl.golakiya@gmail.com

## License

SwiftExtension is available under the MIT license. See the LICENSE file for more info.
