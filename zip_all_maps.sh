echo ""
echo "=========================================="
echo "Zipping up all map files into all_maps.zip"
echo "=========================================="
echo ""
find . -type f -iname "*.map" -print0 -o -iname "*.mp2" -print0 | xargs -0 zip -j all_maps.zip
