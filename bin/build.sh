#!/usr/bin/env bash

# show each line before run
set -o xtrace

# create build
mkdir -p build/bin
cp bin/run build/bin/run
cp -r src build/src
cp composer.json build/composer.json

# copy configs
cp box.json build/box.json
cp scoper.inc.php build/scoper.inc.php

# composer
composer require --no-update dg/composer-cleaner:^2.0 -d build
composer update --no-dev --classmap-authoritative -d build

# build + prefix
mkdir -p tmp/build
vendor/bin/box compile --config build/box.json -vvv
