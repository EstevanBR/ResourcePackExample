import Foundation
import MyLibrary
import SwiftGodot
import SwiftGodotKit

private func main() {
    guard let packPath = Bundle.module.path(forResource: "MyGame", ofType: "pck") else {
        fatalError("Could not find path for Resource.pck")
    }
    
    runGodot(
        args: [
            "--main-pack", packPath,
        ],
        initHook: registerTypes,
        loadScene: loadScene,
        loadProjectSettings: { projectSettings in
            print(projectSettings)
        },
        verbose: true
    )
}

private func loadScene(scene: SceneTree) {
    guard let root = scene.root else {
        fatalError("scene.root was nil")
    }

    guard let myFirstLevelPackedScene: PackedScene = GD.load(path: "res://my_first_level.tscn"),
          let myFirstLevel = myFirstLevelPackedScene.instantiate() as? MyLevel else {
        fatalError("could not load res://my_first_level.tscn")
    }

    root.addChild(node: myFirstLevel)

    GD.printDebug(root.getTreeStringPretty())
}

private func registerTypes(level: GDExtension.InitializationLevel) {
    switch level {
    case .core: break
    case .servers: break
    case .scene:
        MyLibrary.types.forEach { register(type: $0) }
    case .editor: break
    }
}

main()
