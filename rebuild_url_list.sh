for build in `grep '#' maps.md`; do
        build_num=${build##*#}
        url=`wget -q -O - https://circleci.com/api/v1/project/navit-gps/maptool/${build_num}/artifacts?circle-token=$api_tk|awk 'BEGIN { FS = "\"" } ; /url/ { print $4 }'`
        sed -i -e "s@#${build_num}@(${url})@" maps.md
done
