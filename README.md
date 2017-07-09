#  Upconvert: conveniently perform safe conversions

The `Upconvert` framework allows convenient, lossless conversions between different types in Swift. Conversion is performed using the upconversion operator, `^`:

```swift
let small: Int8 = 1
let large: Int = 100_000
print(large + ^small)       // => 100002
```

Upconversion is only allowed when the destination type is large enough to contain all possible values of the source type. Otherwise, your code will not compile.

```swift
let small: Int8 = 1
let large: Int = 100_000

large + ^small      // OK
^large + small      // Error
```

## Supported upconversions

`Upconvert` ships with the following conversions built in:

* `Int8` → `Int16` → `Int32` → `Int` → `Int64`
* `UInt8` → `UInt16` → `UInt32` → `UInt` → `UInt64`
* `Float` → `CGFloat` → `Double` → `Float80`
* `Substring` → `String`
* `UnicodeScalar` → `Character` → `String`
* `KeyPath` → getter function

The `KeyPath` upconversion allows you to use key paths with functions like `map` and `filter`:

```swift
let names = people.map(^\.name)
```

You can add your own upconversions by conforming types to the `Upconvertible` protocol.

## Installation

Just clone it and put the project into Xcode. Pull requests to support package managers are welcome.

## Limitations

* Downconversions—potentially lossy conversions—are not supported.

* Each type can only upconvert to one other type (plus the type it upconverts to, recursively). This is why you can't upconvert a `UInt32` to an `Int64`.

* The `Int` and `UInt` conversion sequences don't support the new `DoubleWidth` type due to limitations in its current implementation.

## Author

[Brent Royal-Gordon](https://github.com/brentdax), Architechies.

## Copyright

Copyright © 2017 Architechies. Distributed under the MIT License.
