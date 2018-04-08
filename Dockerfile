FROM golang:1.8-alpine
ADD . /go/src/k8s_server
RUN go install k8s_server

FROM alpine:latest
COPY --from=0 /go/bin/k8s_server .
ENV PORT 8080
CMD ["./k8s_server"]
