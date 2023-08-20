// swift-tools-version:5.9
import PackageDescription

let package = Package(
  name: "Yams",
  platforms: [
    .macOS(.v14),
    .visionOS(.v1),
    .iOS(.v17),
    .tvOS(.v16),
    .watchOS(.v9),
  ],
  products: [
    .library(name: "Yams", targets: ["Yams"]),
  ],
  dependencies: [],
  targets: [
    .target(
      name: "CYaml",
      exclude: ["CMakeLists.txt"],
      cSettings: [.define("YAML_DECLARE_STATIC")]
    ),
    .target(
      name: "Yams",
      dependencies: ["CYaml"],
      exclude: ["CMakeLists.txt"],
      cSettings: [.define("YAML_DECLARE_STATIC")]
    ),
    .testTarget(
      name: "YamsTests",
      dependencies: ["Yams"],
      exclude: ["CMakeLists.txt"],
      resources: [
        .copy("Fixtures/SourceKitten#289/debug.yaml"),
      ]
    ),
  ]
)
