unameOut="$(uname -s)"

dockerImage="rtorralba/zx-game-maker:latest"

for i in "$@"; do
    case $i in
        --develop)
            echo -e "Using DEVELOP image... ========================================\n\n"
            dockerImage="rtorralba/zx-game-maker:develop"
            ;;
        --update)
            echo -e "Checking updates... =======================================\n\n"
            docker pull $dockerImage
            echo -e "\n\n\n"
            ;;
    esac
done

if [[ $unameOut == "Linux" ]]; then
    echo -e "Compiling for Linux... ====================================\n\n"
    tiled --export-map json assets/maps.tmx output/maps.json
else
    echo -e "Compiling for MacOS... ====================================\n\n"
    /Applications/Tiled.app/Contents/MacOS/Tiled --export-map json assets/maps.tmx output/maps.json
fi

docker run -v "${PWD}"/assets:/app/assets -v "${PWD}"/output:/app/output -v "${PWD}"/dist:/app/dist -it --rm $dockerImage