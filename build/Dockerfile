FROM alpine:3.13
COPY build.sh /tmp
RUN /bin/sh /tmp/build.sh
WORKDIR /etc/nginx
COPY nginx.conf nginx.conf
COPY staticx.conf conf.d/staticx.conf
COPY error.html pages/
COPY index.html staticx/
EXPOSE 80
ENTRYPOINT [ "nginx" ]
CMD ["-g", "daemon off;"]