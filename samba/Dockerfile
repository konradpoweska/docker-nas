FROM alpine:3.13

RUN apk add --no-cache samba

EXPOSE 445

COPY cmd.sh ./

CMD ["./cmd.sh"]
