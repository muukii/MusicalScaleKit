import PackageDescription

let package = Package(
    name: "MusicalScale",
    targets: [
      Target(name: "Demo", dependencies: ["MusicalScale"]),
      Target(name: "MusicalScale", dependencies: ["MusicalScaleCore"]),
      Target(name: "MusicalScaleCore")
    ]
)
