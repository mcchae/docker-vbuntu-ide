FROM mcchae/vbuntu
MAINTAINER MoonChang Chae mcchae@gmail.com
LABEL Description="ubuntu desktop env with ide (over xfce with xrdp)"

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update \
    && apt-get install -y curl \
    && apt-get clean \
    && apt-get autoclean

################################################################################
# pycharm
################################################################################
WORKDIR /usr/local
ENV PYCHARM_VER pycharm-professional-2019.1.2
RUN curl -SL https://download.jetbrains.com/python/$PYCHARM_VER.tar.gz | \
		tar -xz -f - \
	&& PYCHARM_DIR=$(find /usr/local -type d -name "pycharm*" -maxdepth 1) \
    && ln -s $PYCHARM_DIR /usr/local/pycharm

WORKDIR /

ADD chroot/usr /usr
