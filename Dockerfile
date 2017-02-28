FROM alpine:latest

WORKDIR /root/

COPY kgo-example-web .

CMD ["./kgo-example-web"]
