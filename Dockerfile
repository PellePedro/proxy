FROM golang:1.10.1-alpine3.7 as builder
#
COPY . /go/src/proxy
WORKDIR /go/src/proxy
RUN go build -a --ldflags '-extldflags "-static"' -tags netgo -installsuffix netgo -o bin/proxy proxy.go
#
FROM alpine:3.7
WORKDIR /usr/bin
COPY --from=builder /go/src/proxy/bin/proxy .
CMD ["proxy"]
