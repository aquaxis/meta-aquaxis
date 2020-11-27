# meta-aquaxis

## Create a work directory

```bash
$ mkdir <BUILD_DIR>
$ cd <BUILD_DIR>
```

## Download & Build Yocto Project

1. Download a meta-aquaxis
2. Execute a create_env.sh
3. Build PMU Firmware
4. Build Linux Distribution

```bash
$ git clone https://github.com/aquaxis/meta-aquaxis
$ ./meta-aquaxis/create_env.sh
$ cd poky/
$ source ./oe-init-build-env ../build_pmu-firmware/
$ bitbake pmu-firmware
$ cd ../poky/
$ source ./oe-init-build-env ../build_ultra96v2/
$ mv ../build_pmu-firmware/pmutmp .
$ bitbake core-image-minimal
```

## Create SD Card Image

Execute a next command in `build_ultra96v2`.

Please, build a fsbl.elf for yourself on the vitis.

```txt
$ cd sd_card
$ ./mkbootbin.sh
$ ./mksdcard.sh
```

## Build SDK

```txt
$ bitbake core-image-minimal -c populate_sdk
```

## Install SDK

```txt
$ ./poky-glibc-x86_64-core-image-minimal-aarch64-ultra96v2-toolchain-3.0.2.sh 
Poky (Yocto Project Reference Distro) SDK installer version 3.0.2
=================================================================
Enter target directory for SDK (default: /opt/poky/3.0.2): /opt/poky/3.0.2_ultra96v2
You are about to install the SDK to "/opt/poky/3.0.2_ultra96v2". Proceed [Y/n]? 
Extracting SDK.............................................................................................................................................................................................................................done
Setting it up...done
SDK has been successfully set up and is ready to be used.
Each time you wish to use the SDK in a new shell session, you need to source the environment setup script e.g.
 $ . /opt/poky/3.0.2_ultra96v2/environment-setup-aarch64-poky-linux
```

# about
