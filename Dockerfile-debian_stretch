FROM debian:stretch

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections && \
    apt-get update && \
    apt-get install -y apt-utils && \
    apt-get upgrade -y && \
    rm -f /etc/apt/sources.list.d/jessie-backports.list && \
    apt-get install -y \
        openjdk-8-jre-headless \
        systemd \
        apache2 \
        python \
        python-apt \
        sudo \
        cron \
        rsync \
        curl \
        apt-transport-https && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    a2enmod ssl rewrite proxy proxy_http headers

CMD ["/lib/systemd/systemd"]
