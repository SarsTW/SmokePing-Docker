FROM debian:10.0-slim

RUN apt-get update -y && apt-get install -y smokeping \
    && apt-get clean && apt-get autoremove -y && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD start.sh /

CMD ["/start.sh"]

