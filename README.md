
# Prerequisites

## Needed packages

You will need to install the device tree compiler. On Ubuntu this is in the device-tree-compiler package.

```
sudo apt-get install device-tree-compiler 
```

## Extract the Foundation model

This needs an account on the ARM site to download. The r11p0 release is known to work.

```
tar xvzf FM000-KT-00035-r11p0-34rel0.tgz
```

## Download and extract UEFI

```
wget http://snapshots.linaro.org/member-builds/armlt-platforms-release/$RELEASE/fvp-uefi.zip
unzip fvp-uefi.zip
```

and replace $RELEASE is the latest uefi release. FreeBSD was tested with version 51.

# Download and extract the FreeBSD disk image

```
wget http://ftp.freebsd.org/pub/FreeBSD/snapshots/VM-IMAGES/$VERSION-CURRENT/aarch64/Latest/FreeBSD-$VERSION-CURRENT-arm64-aarch64.raw.xz
xz -d FreeBSD-$VERSION-CURRENT-arm64-aarch64.raw.xz
```

and replace $VERSION with the latest FreeBSD version. Version 12.0 has been tested and is known to work.

## Build the device tree blob

```
./fvp-freebsd/build.sh
```

The script builds the device tree blob with the GICv3 controller.

**NOTE**: If you want to use a different device tree make sure the device tree blob is located in the same directory as run.sh and has the name `fvp-foundation-gicv3-psci.dtb` in order for the UEFI to automatically detect and load.

# Running FreeBSD

To run FreeBSD there is a script. It will pick up the Model and UEFI if they are in the default location.

```
DISK=FreeBSD-12.0-CURRENT-arm64-aarch64.raw ./fvp-freebsd/run.sh
```

