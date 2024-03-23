unameOut="$(uname -s)"

if [[ $1 == "--update" ]]; then
    echo -e "Checking updates... =======================================\n\n"
    docker pull rtorralba/zx-game-maker
    echo -e "\n\n\n"
fi

if [[ $unameOut == "Linux" ]]; then
    echo -e "Compiling for Linux... ====================================\n\n"
    tiled --export-map json assets/maps.tmx output/maps.json
else
    echo -e "Compiling for MacOS... ====================================\n\n"
    /Applications/Tiled.app/Contents/MacOS/Tiled --export-map json assets/maps.tmx output/maps.json
fi

docker run -v "${PWD}"/assets:/app/assets -v "${PWD}"/output:/app/output -v "${PWD}"/dist:/app/dist -it --rm rtorralba/zx-game-maker