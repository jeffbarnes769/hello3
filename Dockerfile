FROM golang
# RUN apk update && apk add ca-certificates && rm -rf /var/cache/apk/*
ADD https://get.aquasec.com/microscanner /
RUN chmod +x /microscanner
ARG token
RUN /microscanner --html ${token} > /stage1.html --continue-on-failure
RUN mkdir -p /hello
WORKDIR /hello
ADD . /hello
RUN go build ./hello.go
CMD ["./hello"]