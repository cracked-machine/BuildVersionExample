FROM ubuntu:22.04
ENV  DEBIAN_FRONTEND=noninteractive
RUN apt update -y && apt install -y \
    sudo\
    make\
    git\
    build-essential\
    cmake \
    gdb \
    gdbserver \
    udev \
    usbutils \
    clangd \
    python3 \
    gcovr \
    locales

# used for on-board JTAG (i.e. not the USB-to-UART bridge)
# RUN wget -O /etc/udev/rules.d/60-openocd.rules https://raw.githubusercontent.com/espressif/openocd-esp32/refs/heads/master/contrib/60-openocd.rules

RUN locale-gen en_US.UTF-8 && update-locale

ARG USER=user

RUN useradd -m $USER && echo "$USER:$USER" | chpasswd && adduser $USER sudo
RUN echo "$USER            ALL = (ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN adduser $USER dialout
RUN adduser $USER plugdev

CMD /bin/bash