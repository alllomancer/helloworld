FROM golang:1.8
WORKDIR /go/src/github.com/alllomancer/helloworld
COPY hello-world.go .
RUN go test

RUN go build -o hello-world .

CMD ./hello-world
