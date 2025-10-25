// swift-tools-version: 6.0
import PackageDescription

let package = Package(
  name: "AuthCoreKit",
  platforms: [.iOS(.v18)],
  products: [
    .library(name: "AuthCoreKit", targets: ["AuthCoreKit"]),
    .library(name: "AuthCore", targets: ["AuthCore"]) // for internal consumers like LoginUX/Payments
  ],
  targets: [
    .target(name: "AuthCore", path: "Sources/AuthCore"),
    .target(name: "AuthCoreKit", dependencies: ["AuthCore"], path: "Sources/AuthCoreKit"),
    .testTarget(name: "OAuthTests", dependencies: ["AuthCore"], path: "Tests/OAuthTests"),
    .testTarget(name: "DPoPTests", dependencies: ["AuthCore"], path: "Tests/DPoPTests"),
    .testTarget(name: "OIDCTests", dependencies: ["AuthCore"], path: "Tests/OIDCTests"),
    .testTarget(name: "StorageTests", dependencies: ["AuthCore"], path: "Tests/StorageTests")
  ]
)
