// swift-tools-version: 5.5

import PackageDescription

let package = Package(
  name: "ColorHexRGB",
  platforms: [
    .macOS("10.13"),
  ],
  products: [
    .library(
      name: "ColorHexRGB",
      targets: ["ColorHexRGB"]),
  ],
  targets: [
    .target(
      name: "ColorHexRGB",
      dependencies: []),
    .testTarget(
      name: "ColorHexRGBTests",
      dependencies: ["ColorHexRGB"]),
  ]
)
