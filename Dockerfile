FROM crealytics/kafka:0.10.2
COPY mirror-maker.sh /opt/mirror-maker.sh
RUN chmod uga+x /opt/mirror-maker.sh
CMD ["/opt/mirror-maker.sh"]
