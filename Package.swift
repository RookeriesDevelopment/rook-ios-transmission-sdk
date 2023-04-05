// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "RookTransmission",
  
  platforms: [
    .iOS(.v13)
  ],
  
  products: [
    .library(
      name: "RookTransmission",
      targets: ["RookTransmission"]),
  ],
  
  dependencies: [
  ],
  targets: [
    
    .target(name: "RookTransmission",
            dependencies: ["RookConnectTransmission"],
            cxxSettings: [
              .headerSearchPath("include")
            ]
           ),
    
    
      .binaryTarget(name: "RookConnectTransmission",
                    path: "RookConnectTransmission/RookConnectTransmission.xcframework")
  ]
)
