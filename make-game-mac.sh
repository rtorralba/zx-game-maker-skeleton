#!/bin/bash
if [ -f /Applications/Tiled.app/Contents/MacOS/Tiled ] 
then
	/Applications/Tiled.app/Contents/MacOS/Tiled --export-map json assets/maps.tmx output/maps.json
	docker pull rtorralba/zx-game-maker
	docker run -v "${PWD}"/assets:/app/assets -v "${PWD}"/output:/app/output -v "${PWD}"/dist:/app/dist -it --rm rtorralba/zx-game-maker
else
	echo "Tiled not found" 1>&2
fi