# MusicalScaleKit

[![CI Status](http://img.shields.io/travis/muukii/MusicalScaleKit.svg?style=flat)](https://travis-ci.org/muukii/MusicalScaleKit)
[![Version](https://img.shields.io/cocoapods/v/MusicalScaleKit.svg?style=flat)](http://cocoapods.org/pods/MusicalScaleKit)
[![License](https://img.shields.io/cocoapods/l/MusicalScaleKit.svg?style=flat)](http://cocoapods.org/pods/MusicalScaleKit)
[![Platform](https://img.shields.io/cocoapods/p/MusicalScaleKit.svg?style=flat)](http://cocoapods.org/pods/MusicalScaleKit)

## Example

### Create from ScaleDegree

```swift
public struct Scale {

    public let degrees: [Degree]

    public let key: Note

    public init(key: Note, degrees: [Degree])    

    public var notes: [Note] { get }
}
```

#### Get IonianScale(MajorScale)

```swift
let ionianScale = Scale(
    key: .C(.natural),
    degrees: [
        .one(.natural),
        .two(.natural),
        .three(.natural),
        .four(.natural),
        .five(.natural),
        .six(.natural),
        .seven(.natural),
    ]
)

print(ionianScale)
```

```
key: C
degrees: [1, 2, 3, 4, 5, 6, 7]
notes: [C, D, E, F, G, A, B]
```

#### Get DorianScale

```swift
let dorianScale = Scale(
    key: .C(.natural),
    degrees: [
        .one(.natural),
        .two(.natural),
        .three(.flat),
        .four(.natural),
        .five(.natural),
        .six(.natural),
        .seven(.flat),
    ]
)

print(dorianScale)
```

```
key: C
degrees: [1, 2, ♭3, 4, 5, 6, ♭7]
notes: [C, D, D#, F, G, A, A#]
```

### Create Note

```swift
let a = Note.a(.natural)
let a_flat = Note.a(.flat)
let a_sharp = Note.a(.sharp)
```

or

```swift
let a = Note.a(.natural)
let a_flat = a.flat()
let a_sharp = a.sharp()
```

## Requirements

## Installation

MusicalScaleKit is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "MusicalScaleKit"
```

## Author

muukii, m@muukii.me

## License

MusicalScaleKit is available under the MIT license. See the LICENSE file for more info.
