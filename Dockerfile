FROM ubuntu:bionic

RUN apt-get -qq update
RUN apt-get -y -q install wget perl libfontconfig fontconfig ghostscript
RUN cd / \
    && mkdir texlive \
    && cd texlive \
    && wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz -O- | tar zxf -
COPY installation.profile /texlive
RUN cd /texlive* \
    && ./install-tl --profile ../installation.profile
ENV PATH=/usr/local/texlive/2020/bin/x86_64-linux/:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin