# ColorHexRGB

![Swift 4.2](https://img.shields.io/badge/Swift-4.2-green.svg?style=flat)
![Swift 5.x](https://img.shields.io/badge/Swift-5.x-blue.svg?style=flat)
![Version](https://img.shields.io/github/tag/CleanCocoa/ColorHexRGB.svg?style=flat)
![License](https://img.shields.io/github/license/CleanCocoa/ColorHexRGB.svg?style=flat)
![Platform](https://img.shields.io/badge/platform-macOS-lightgrey.svg?style=flat)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)


A very simple one-file drop in to convert `NSColor` to RGB-hex Strings and back.

- `NSColor.init?(hexString:)` converts `RGB`, `RRGGBB`, or `AARRGGBB` formats to colors.
- `NSColor.rgbString` and `NSColor.argbString` do it the other way around.

Used to read color hex strings from theme files and CSS.

# License 

Copyright (c) 2018--2020 Christian Tietze. Distributed under the MIT License.
