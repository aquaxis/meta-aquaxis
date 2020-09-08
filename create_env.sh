#!/bin/bash

# Version/バージョン
VERSION="dunfell"

echo 'Download Version: ' $VERSION

# Downdload poky/pokyのダウンロード
git clone https://git.yoctoproject.org/git/poky.git -b $VERSION

# Download for other recipes/追加レシピをダウンロード
mkdir -p sources
cd sources

git clone https://github.com/openembedded/meta-openembedded.git -b $VERSION
#git clone https://github.com/xilinx/meta-xilinx -b $VERSION
#git clone https://github.com/xilinx/meta-xilinx -b zeus
git clone https://github.com/xilinx/meta-xilinx -b rel-v2020.1
sed -i -e 's/zeus/dunfell/g' meta-xilinx/meta-xilinx-bsp/conf/layer.conf
sed -i -e 's/zeus/dunfell/g' meta-xilinx/meta-xilinx-pynq/conf/layer.conf
sed -i -e 's/zeus/dunfell/g' meta-xilinx/meta-xilinx-contrib/conf/layer.conf
sed -i -e 's/zeus/dunfell/g' meta-xilinx/meta-xilinx-standalone/conf/layer.conf
# Python2
git clone https://git.openembedded.org/meta-python2

# git clone https://github.com/aquaxis/meta-aquaxis.git -b $VERSION
mv ../meta-aquaxis ./

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
cp ../sources/meta-aquaxis/conf/template/ultra96v2/bblayers.conf ./conf
cp ../sources/meta-aquaxis/conf/template/ultra96v2/local.conf ./conf
touch ./conf/sanity.conf

# Create SD Card directory/SDカードディレクトリの作成
mkdir sd_card
cp ../sources/meta-aquaxis/conf/template/sd_card/* ./sd_card/

cd ..

# Create a build directory/ビルドディレクトリの作成
cd poky
source ./oe-init-build-env ../build_pmu-firmware

# Copy a config file/設定のコピー
cp ../sources/meta-aquaxis/conf/template/pmu-firmware/bblayers.conf ./conf
cp ../sources/meta-aquaxis/conf/template/pmu-firmware/local.conf ./conf
touch ./conf/sanity.conf
