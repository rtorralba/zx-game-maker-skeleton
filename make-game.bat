"c:\Program Files\Tiled\tiled.exe" --export-map json assets/maps.tmx output/maps.json
docker pull rtorralba/zx-game-maker
docker run -v %cd%/assets:/app/assets -v %cd%/output:/app/output -it --rm rtorralba/zx-game-maker
pause