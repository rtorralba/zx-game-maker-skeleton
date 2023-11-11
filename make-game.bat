"c:\Program Files\Tiled\tiled.exe" --export-map json assets/maps.tmx output/maps.json
docker run -v %cd%/assets:/app/assets -v %cd%/output:/app/output -it --rm rtorralba/zx-game-maker:0.0.1
pause