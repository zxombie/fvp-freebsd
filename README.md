
# Prerequisites

## Needed packages

You will need to install the device tree compiler. On Ubuntu this is in the device-tree-compiler package.

```
sudo apt-get install device-tree-compiler 
```

## Extract the Foundation model

This needs an account on the ARM site to download. The r9p6 release is known to work.

```
tar xvzf FM000-KT-00035-r9p6-41rel0.tgz
```

## Download and extract UEFI

```
wget http://snapshots.linaro.org/member-builds/armlt-platforms-release/22/fvp-uefi.zip
unzip fvp-uefi.zip
```

# Download and extract the FreeBSD disk image

```
wget http://ftp.freebsd.org/pub/FreeBSD/snapshots/VM-IMAGES/11.0-CURRENT/aarch64/Latest/FreeBSD-11.0-CURRENT-arm64-aarch64.raw.xz
xz -d FreeBSD-11.0-CURRENT-arm64-aarch64.raw.xz
```

## Build the device tree blob

```
./fvp-freebsd/build.sh
```

# Running FreeBSD

To run FreeBSD there is a script. It will pick up the Model and UEFI if they are in the default location.

```
DISK=FreeBSD-11.0-CURRENT-arm64-aarch64.raw ./fvp-freebsd/run.sh
```

