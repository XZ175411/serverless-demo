FROM golang:1.14 as builder

WORKDIR  /home/works/program

ADD . .
ENV GOPROXY=https://goproxy.cn

RUN sh build.sh


FROM alpine:latest


RUN echo "http://mirrors.aliyun.com/alpine/latest-stable/main/" > /etc/apk/repositories \
    && rm -rf /var/cache/apk/* \
    && rm -rf /tmp/* \
    && apk update \
    && apk add --no-cache -U tzdata ca-certificates libc6-compat libgcc libstdc++ \
    && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && apk del tzdata

WORKDIR  /home/works/program

EXPOSE 8080

COPY --from=builder /home/works/program/bin/ ./

ENV CONFIG_FILE_PATH=settings.yml

CMD ["./main"]
