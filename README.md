About
=========

The `sasquatch` project is a set of patches to the standard unsquashfs utility (part of squashfs-tools) that attempts to add support for as many hacked-up vendor-specific SquashFS implementations as possible.

If the vendor has done something simple like just muck a bit with the header fields, `sasquatch` should sort it out.

If the vendor has made changes to the underlying LZMA compression options, or to how these options are stored in the compressed data blocks, `sasquatch` will attempt to automatically resolve such customizations via a brute-force method.

Additional advanced command line options have been added for testing/debugging.

Very beta.

Prerequisites
=============

You need a C/C++ compiler, plus the liblzma, liblzo and zlib development libraries:

```bash
$ sudo apt-get install build-essential liblzma-dev liblzo2-dev zlib1g-dev
```

Installation
============

The included `build.sh` script will download squashfs-tools v4.3, patch the source, then build and install `sasquatch`:

```bash
$ ./build.sh
```

Running in Docker
=================

Building container:

```bash
docker build -t sasquatch .
```

Simple wrapper script to be put into `$HOME/bin` (included in `$PATH`):

```bash
#!/bin/sh
docker run --interactive --tty --rm \
    --volume "$(realpath "$PWD"):/wd" --workdir /wd \
    sasquatch "$@"
```

This setup works on Docker for Desktop 3.1.0 on MacOSX. The `realpath` comes from GNU coreutils - e.g. `brew install coreutils`.
