//  Copyright © 2018 Christian Tietze. All rights reserved. Distributed under the MIT License.

import XCTest
import ColorHexRGB

class ColorHexRGBTests: XCTestCase {

    func testRGBConversion() {
        let initialColor = NSColor(calibratedRed: 0.4, green: 0.5, blue: 0.6, alpha: 0.8)

        guard let rgbString = initialColor.rgbString else { XCTFail("Conversion to Hex failed"); return }
        guard let colorFromRGB = NSColor(hexString: rgbString) else { XCTFail("Conversion from Hex failed"); return }

        let convertedColorInDeviceSpace = colorFromRGB.usingColorSpace(NSColor.hexConversionColorSpace)!
        let initialColorInDeciveSpace = initialColor.usingColorSpace(NSColor.hexConversionColorSpace)!

        XCTAssertEqual(convertedColorInDeviceSpace.rgbString,
                       initialColorInDeciveSpace.rgbString)
        XCTAssertEqual(convertedColorInDeviceSpace.redComponent,
                       initialColorInDeciveSpace.redComponent,
                       accuracy: 0.005)
        XCTAssertEqual(convertedColorInDeviceSpace.greenComponent,
                       initialColorInDeciveSpace.greenComponent,
                       accuracy: 0.005)
        XCTAssertEqual(convertedColorInDeviceSpace.blueComponent,
                       initialColorInDeciveSpace.blueComponent,
                       accuracy: 0.005)
    }

    func testARGBConversion() {
        let initialColor = NSColor(calibratedRed: 0.8, green: 0.2, blue: 0.1, alpha: 0.4)

        guard let argbString = initialColor.argbString else { XCTFail("Conversion to Hex failed"); return }
        guard let colorFromRGB = NSColor(hexString: argbString) else { XCTFail("Conversion from Hex failed"); return }

        let convertedColorInDeviceSpace = colorFromRGB.usingColorSpace(NSColor.hexConversionColorSpace)!
        let initialColorInDeciveSpace = initialColor.usingColorSpace(NSColor.hexConversionColorSpace)!

        XCTAssertEqual(convertedColorInDeviceSpace.rgbString,
                       initialColorInDeciveSpace.rgbString)
        XCTAssertEqual(convertedColorInDeviceSpace.redComponent,
                       initialColorInDeciveSpace.redComponent,
                       accuracy: 0.005)
        XCTAssertEqual(convertedColorInDeviceSpace.greenComponent,
                       initialColorInDeciveSpace.greenComponent,
                       accuracy: 0.005)
        XCTAssertEqual(convertedColorInDeviceSpace.blueComponent,
                       initialColorInDeciveSpace.blueComponent,
                       accuracy: 0.005)
        XCTAssertEqual(convertedColorInDeviceSpace.alphaComponent,
                       initialColorInDeciveSpace.alphaComponent,
                       accuracy: 0.005)
    }
}
