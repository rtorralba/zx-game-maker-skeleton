"c:\Program Files\Tiled\tiled.exe" --export-map json assets/maps.tmx output/maps.json
docker run -v %cd%/assets:/app/assets -v %cd%/output:/app/output -v %cd%/dist:/app/dist -it --rm rtorralba/zx-game-maker:develop
pause