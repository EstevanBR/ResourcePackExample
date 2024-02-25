all: gdextension pack

gdextension: build remove deploy

build:
	echo "going to build the package"
	swift build

remove:
	echo "remove the existing libraries from res://bin of the Godot Project"
	rm -f ./MyProject/bin/libSwiftGodot.*
	rm -f ./MyProject/bin/libMyLibrary.*

deploy:
	echo "deploy the new libraries to res://bin of the Godot Project"
	cp .build/debug/libSwiftGodot.* ./MyProject/bin
	cp .build/debug/libMyLibrary.* ./MyProject/bin

pack:
	echo "create MyGame.pck in MyGame/Resources/MyGame.pck"
	"$(GODOT4)" --headless --path ./MyProject --export-pack Packer ../Sources/MyGame/Resources/MyGame.pck

run:
	swift run MyGame