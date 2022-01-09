FROM golang AS builder

WORKDIR /build

# Dependencies
RUN go get github.com/koron/go-ssdp && \
	go get github.com/gorilla/websocket && \
	go get github.com/kardianos/osext


# Copy of source files
COPY . .

# Disable CGO Tool
ENV CGO_ENABLED=0

# xTeVe build
RUN go build xteve.go

# ------------------------------------------------------------------------------

FROM alpine:latest  

# Installation of ca-certificates, ffmpeg and vlc
RUN apk add --no-cache ca-certificates curl ffmpeg vlc && \
	rm -rf /var/cache/apk/*

# Copy binary from build stage
COPY --from=builder /build/xteve /xteve

VOLUME ["/config"]
ENV PORT 34400

HEALTHCHECK --start-period=30s \
        CMD curl --fail http://localhost:${PORT}/web || exit 1

CMD ["sh", "-c", "/xteve -config /config -port ${PORT}"] 
