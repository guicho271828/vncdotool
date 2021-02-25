FROM ubuntu:18.04
ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true
RUN apt-get -y update && apt-get install -y tightvncserver ratpoison
RUN echo "tzdata tzdata/Areas select America" > ~/tx.txt && \
	echo "tzdata tzdata/Zones/America select New York" >> ~/tx.txt && \
	debconf-set-selections ~/tx.txt
RUN useradd -m user
USER user
ENV USER user
ENV HOME /home/user
ENV PASSWORD password1
WORKDIR $HOME
COPY command.sh command.sh
COPY ratpoisonrc .ratpoisonrc
RUN \
	mkdir .vnc/ && \
	echo $PASSWORD | vncpasswd -f > .vnc/passwd && \
        chmod 0600 .vnc/passwd
EXPOSE 5901
CMD ./command.sh

