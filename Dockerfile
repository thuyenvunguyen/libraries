FROM debian:stretch

RUN apt-get update &&\
    apt-get install -y \
        sudo time git-core subversion build-essential g++ bash make \
        libssl-dev patch libncurses5 libncurses5-dev zlib1g-dev gawk \
        flex gettext wget unzip xz-utils python python-distutils-extra \
        python3 python3-distutils-extra rsync curl libsnmp-dev liblzma-dev \
        libpam0g-dev cpio rsync && \
    apt install -y openssh-server && \
    apt install -y quilt && \
    apt install -y bc && \
    apt install -y xxd && \
    apt install -y vim cscope ctags && \
    ln -sf /bin/bash /bin/sh && \
    dpkg --add-architecture i386 && \
    apt-get update &&\
    apt install -y libc6:i386 libncurses5:i386 libstdc++6:i386 && \
    apt-get clean && \
    useradd -m user && \
    echo 'user ALL=NOPASSWD: ALL' > /etc/sudoers.d/user

USER user
WORKDIR /home/user
