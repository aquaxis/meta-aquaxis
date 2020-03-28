#!/bin/bash

# Version/バージョン
VERSION="zeus"

echo 'Download Version: ' $VERSION

# Downdload poky/pokyのダウンロード
git clone https://git.yoctoproject.org/git/poky.git -b $VERSION

# Download for other recipes/追加レシピをダウンロード
mkdir -p sources
cd sources

git clone https://github.com/openembedded/meta-openembedded.git -b $VERSION
git clone https://github.com/xilinx/meta-xilinx -b $VERSION
# git clone https://github.com/aquaxis/meta-ultra96.git -b $VERSION
mv ../meta-ultra96 ./

# Other recipes
# git clone https://git.linaro.org/openembedded/meta-linaro.git -b $VERSION
# git clone https://github.com/meta-qt5/meta-qt5.git -b $VERSION

# Other machine's recipes
# git clone https://git.yoctoproject.org/meta-raspberrypi -b $VERSION
# git clone https://git.yoctoproject.org/meta-ti -b thud

cd ..

# Create a build directory/ビルドディレクトリの作成
cd poky
source ./oe-init-build-env ../build_ultra96v2

# Copy a config file/設定のコピー
cp ../sources/meta-ultra96/conf/template/ultra96v2/bblayers.conf ./conf
cp ../sources/meta-ultra96/conf/template/ultra96v2/local.conf ./conf

cd ..

# Create a build directory/ビルドディレクトリの作成
cd poky
source ./oe-init-build-env ../build_pmu-firmware

# Copy a config file/設定のコピー
cp ../sources/meta-ultra96/conf/template/pmu-firmware/bblayers.conf ./conf
cp ../sources/meta-ultra96/conf/template/pmu-firmware/local.conf ./conf