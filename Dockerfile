FROM golang:alpine AS builder

WORKDIR /src

COPY main.go .

RUN go mod init hello-docker

RUN go mod tidy 

RUN go build

FROM alpine:3.15

WORKDIR /app

COPY --from=builder /src/hello-docker /app/hello-docker

EXPOSE 8080

ENTRYPOINT ["/app/hello-docker"]