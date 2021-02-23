FROM alpine:latest

RUN apk add --no-cache --update freetype git nodejs npm wine \
    && adduser -D -h /home/container container
RUN git clone https://github.com/bdsx/bdsx.git /home/container

USER container
ENV USER=container HOME=/home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD [ "/bin/ash", "/entrypoint.sh" ]
