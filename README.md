# Resource Pack Example

This repo demonstrates how you can go about loading your resources (images, .tscn files, etc) in a `SwiftGodotKit` project using `res://` paths you're familiar with in `gdscript`.

## Overview
1. You must have a godot project where you import your resources, they must have been imported at least once. See [./MyProject/project.godot](./MyProject/project.godot)
2. We then export the `MyGame.pck` file of your resources, in the same way Godot would when exporting your project. See [`pack` in ./Makefile](./Makefile)
3. Include this `MyGame.pck` file in your `.executableTarget` using `.copy`. See [Package.swift](./Package.swift)
```
.executableTarget(
    name: "MyGame",
    dependencies: [
        "SwiftGodotKit",
        "MyLibrary"
    ],
    resources: [
        .copy("Resources/MyGame.pck")
    ]
)
```