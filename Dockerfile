FROM golang:1.14  AS builder
WORKDIR /go/src/github.com/alllomancer/helloworld
ADD . /go/src/github.com/alllomancer/helloworld
RUN cd /go/src/github.com/alllomancer/helloworld

RUN go test .
RUN go build -o /app/helloworld .
RUN chmod +x /go/src/github.com/alllomancer/helloworld/ldd-cp.sh
RUN /go/src/github.com/alllomancer/helloworld/ldd-cp.sh ldd-cp  /app/helloworld /temp


# Create a small image
FROM busybox AS default-image

COPY --from=builder /temp/ /
CMD /app/helloworld

