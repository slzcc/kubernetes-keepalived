FROM alpine:latest
 
RUN echo "http://nl.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && \
    echo "http://nl.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories && \
    apk --update -t add keepalived iproute2 grep bash tcpdump sed && \
    rm -f /var/cache/apk/* /tmp/*
 
COPY keepalived.conf /etc/keepalived/keepalived.conf
COPY keepalived.sh /usr/bin/keepalived.sh
RUN chmod +x /usr/bin/keepalived.sh
 
ENTRYPOINT ["/usr/bin/keepalived.sh"]
