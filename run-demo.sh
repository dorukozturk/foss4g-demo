#!/bin/bash

git submodule init
git submodule update
curl 'https://data.kitware.com/api/v1/item/596cc7728d777f16d01e9bdd/download' -o nlcd_ny.tif
docker pull dozturk2/ktile
docker run -d -v $PWD/nlcd_ny.tif:/opt/ktile/examples/landcover/nlcd_ny.tif --net=host dozturk2/ktile:latest
cd geojs
npm install
npm run build
npm run examples
