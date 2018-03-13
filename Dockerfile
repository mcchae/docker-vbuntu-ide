FROM mcchae/vbuntu
MAINTAINER MoonChang Chae mcchae@gmail.com
LABEL Description="ubuntu desktop env with ide (over xfce with xrdp)"

################################################################################
# pycharm
################################################################################
WORKDIR /usr/local
ENV PYCHARM_VER pycharm-professional-2017.3.3
RUN curl -SL https://download.jetbrains.com/python/$PYCHARM_VER.tar.gz | \
		tar -f - -xz --exclude "*/jre64" -f - \
	&& PYCHARM_DIR=$(find /usr/local -type d -name "pycharm*" -maxdepth 1) \
    && ln -s $PYCHARM_DIR /usr/local/pycharm

WORKDIR /

ADD chroot/usr /usr
