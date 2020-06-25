FROM golang:1.14  AS builder
WORKDIR /go/src/github.com/alllomancer/helloworld
ADD . /go/src/github.com/alllomancer/helloworld
RUN cd /go/src/github.com/alllomancer/helloworld

RUN go build -o /app/helloworld .
RUN chmod +x /go/src/github.com/alllomancer/helloworld/ldd-cp.sh
RUN /go/src/github.com/alllomancer/helloworld/ldd-cp.sh ldd-cp  /app/helloworld /temp

CMD /app/helloworld

FROM busybox AS default-image

COPY --from=builder /temp/ /app/
CMD /app/helloworld

