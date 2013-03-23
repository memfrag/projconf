#!/bin/sh

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
INTERMEDIATE_DIR="${SCRIPT_DIR}/intermediate"
OUTPUT_DIR="${SCRIPT_DIR}/build"

if [ -d "$INTERMEDIATE_DIR" ] ; then
	rm -rf $INTERMEDIATE_DIR
fi
mkdir "$INTERMEDIATE_DIR"

if [ -d "$OUTPUT_DIR" ] ; then
	rm -rf $OUTPUT_DIR
fi
mkdir "$OUTPUT_DIR"

xcodebuild -scheme projconf -configuration Release DSTROOT="$INTERMEDIATE_DIR" INSTALL_PATH=/ SKIP_INSTALL=NO clean build install

mv "${INTERMEDIATE_DIR}/projconf" "${OUTPUT_DIR}/projconf"
rm -rf $INTERMEDIATE_DIR
