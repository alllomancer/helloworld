FROM golang:1.8
WORKDIR /go/src/github.com/alllomancer/helloworld
ADD . /go/src/github.com/alllomancer/helloworld
RUN cd /go/src/github.com/alllomancer/helloworld
RUN go test

RUN go build -o /app/helloworld .

CMD /app/helloworld
