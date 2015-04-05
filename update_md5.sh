for i in `git branch -a|grep -v master`; do
        mapname=${i##*/}
        git checkout $mapname
        if [[ $(expr match ${mapname} 'europe') -ne 0 ]]; then
                prefix="europe/"
                mapname=${mapname:7}
        fi
        wget "http://download.geofabrik.de/$prefix$mapname-latest.osm.pbf.md5" -q -O - > map.md5;
        git add map.md5
        git commit -m "Automatic update of the source map md5" map.md5;
        git push
done
