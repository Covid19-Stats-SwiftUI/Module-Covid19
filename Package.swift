// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Covid19",
  platforms: [.iOS(.v14), .watchOS(.v7)],
  products: [
    // Products define the executables and libraries a package produces, and make them visible to other packages.
    .library(
      name: "Covid19",
      targets: ["Covid19"]),
  ],
  dependencies: [
    // Dependencies declare other packages that this package depends on.
    // .package(url: /* package url */, from: "1.0.0"),
    .package(url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: "5.2.0")),
    .package(name: "Covid19StatsCore", url: "https://github.com/Covid19-Stats-SwiftUI/Covid19StatsCore.git", from: "1.0.0"),
  ],
  targets: [
    // Targets are the basic building blocks of a package. A target can define a module or a test suite.
    // Targets can depend on other targets in this package, and on products in packages this package depends on.
    .target(
      name: "Covid19",
      dependencies: [
        "Alamofire",
        "Covid19StatsCore"
      ]),
    .testTarget(
      name: "Covid19Tests",
      dependencies: ["Covid19"]),
  ]
)