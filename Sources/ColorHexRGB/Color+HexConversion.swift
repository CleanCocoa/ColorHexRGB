//  Copyright © 2018 Christian Tietze. All rights reserved. Distributed under the MIT License.

import AppKit

extension NSColor {
    /// The color space used for Hex Code conversion.
    public static var hexConversionColorSpace: NSColorSpace { return .sRGB }

    /// Converts a hex color code to NSColor in the `hexConversionColorSpace`.
    /// http://stackoverflow.com/a/33397427/6669540
    ///
    /// - parameter hexString: The hex code in `RGB`, `RRGGBB`, or `AARRGGBB` format.
    public convenience init?(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt32()
        Scanner(string: hex).scanHexInt32(&int)
        let a, r, g, b: UInt32

        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            return nil
        }

        var values: [CGFloat] = [CGFloat(r) / 255, CGFloat(g) / 255, CGFloat(b) / 255, CGFloat(a) / 255]
        self.init(colorSpace: NSColor.hexConversionColorSpace, components: &values, count: 4)
    }

    /// Color represented as a Hex RGB string in the `hexConversionColorSpace` of the form `RRGGBB`.
    public var rgbString: String? {
        return argbString.map { $0.dropFirst(2) }.map(String.init)
    }

    /// Color represented as a Hex RGB string in the `hexConversionColorSpace` of the form `AARRGGBB`.
    public var argbString: String? {
        guard let convertedColor = self.usingColorSpace(NSColor.hexConversionColorSpace) else { return nil }

        // Convert the components to numbers (unsigned decimal integer) between 0 and 255
        let redIntValue = Int(convertedColor.redComponent * 255)
        let greenIntValue = Int(convertedColor.greenComponent * 255)
        let blueIntValue = Int(convertedColor.blueComponent * 255)
        let alphaIntValue = Int(convertedColor.alphaComponent * 255)

        // Convert the numbers to hex strings
        let redHexValue = String(format: "%02x", redIntValue)
        let greenHexValue = String(format: "%02x", greenIntValue)
        let blueHexValue = String(format: "%02x", blueIntValue)
        let alphaHexValue = String(format: "%02x", alphaIntValue)

        // Concatenate the red, green, and blue components' hex strings together with a "#"
        return "\(alphaHexValue)\(redHexValue)\(greenHexValue)\(blueHexValue)"
    }

}
