from python

ADD speedtest.sh /app/speedtest.sh

RUN easy_install speedtest-cli
RUN chmod +x /app/speedtest.sh

CMD ["/app/speedtest.sh"]
