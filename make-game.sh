tiled --export-map json assets/maps.tmx output/maps.json
docker pull rtorralba/zx-game-maker
docker run -v ${PWD}/assets:/app/assets -v ${PWD}/output:/app/output -it --rm rtorralba/zx-game-maker