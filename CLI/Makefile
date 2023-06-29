MK_PATH:=$(dir $(realpath $(lastword $(MAKEFILE_LIST))))
MK_PARENT:=$(realpath $(MK_PATH)../)

all: build

build:
	@swift build -c release
	@mv .build/release/arcli /usr/local/bin
	@defaults write arcli project-directory $(MK_PARENT)