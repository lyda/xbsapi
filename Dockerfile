ARG ARCH=
FROM ${ARCH}golang:alpine AS builder

WORKDIR /go/src/app
COPY . .

RUN apk add --update-cache build-base git \
    && make

FROM ${ARCH}alpine:latest AS container

COPY --from=builder /go/src/app/xbsapi /usr/bin/xbsapi

CMD ["xbsapi"]
