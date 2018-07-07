FROM golang AS build-env
ADD https://get.aquasec.com/microscanner /
RUN chmod +x /microscanner
ARG token
ENV env_var=$token
RUN /microscanner ${token} --continue-on-failure 
RUN mkdir -p /app
WORKDIR /app
ADD . /app
RUN go build ./hello.go

# final stage
FROM alpine
RUN apk update && apk add ca-certificates && rm -rf /var/cache/apk/*
WORKDIR /app
COPY --from=build-env /app /app  
RUN cd /app
ADD https://get.aquasec.com/microscanner /
RUN chmod +x /microscanner
#ARG token
RUN /microscanner ${env_var} --continue-on-failure && rm /microscanner 
CMD ./hello

#FROM golang:alpine
#RUN mkdir -p /hello
#WORKDIR /hello
#ADD . /hello
#RUN go build ./hello.go
#CMD ["./hello"]