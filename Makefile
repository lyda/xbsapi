.PHONY: all clean
all:

include .bingo/Variables.mk

VERSION := $(shell git describe --tags 2> /dev/null || git rev-parse --short HEAD)

all: $(ENT) $(OAPI_CODEGEN)
	ENT=$(ENT) OAPI_CODEGEN=$(OAPI_CODEGEN) go generate -x ./...
	go build -ldflags "-X github.com/mrusme/xbsapi/lib.VERSION=$(VERSION)"

clean:
	rm -f xbsapi
