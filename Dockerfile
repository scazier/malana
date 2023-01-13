FROM debian:buster-slim

RUN apt-get update && apt-get upgrade -y
ADD files/install.sh /tmp/install.sh
RUN chmod +x /tmp/install.sh
RUN /tmp/install.sh

ADD files/list.sh /root/list.sh
RUN chmod +x /root/list.sh
RUN echo "[!] Run 'list' to see which tools is installed" >> /root/.bashrc
RUN "/root/list.sh" >> /root/.bashrc
