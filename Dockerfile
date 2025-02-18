FROM ubuntu:22.04

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get install -y \
        git \
        mercurial \
        gcc \
        g++ \
        vim \
        python3 \
        python-setuptools \
        autoconf \
        cvs \
        bzr \
        unrar \
        gdb \
        valgrind \
        uncrustify \
        flex \
        bison \
        libfl-dev \
        tcpdump \
        gsl-bin \
        libgsl-dev \
        sqlite \
        sqlite3 \
        libsqlite3-dev \
        libxml2 \
        libxml2-dev \
        cmake \
        libc6-dev \
        libc6-dev-i386 \
        libclang-dev \
        llvm-dev \
        automake \
        libgtk2.0-0 \
        libgtk2.0-dev \
        vtun \
        lxc \
        libboost-filesystem-dev \
        ninja-build \
        gir1.2-goocanvas-2.0 \
        python3-gi \
        python3-gi-cairo \
        python3-pygraphviz \
        gir1.2-gtk-3.0 \ 
        ipython3 \ 
        libsqlite3-dev \
        qtchooser \
        openmpi-bin \
        openmpi-common \
        openmpi-doc \
        libopenmpi-dev \
        doxygen \
        graphviz \
        imagemagick \
        python3-sphinx \
        libeigen3-dev \
        libgslcblas0 \
        libgtk-3-dev \
        lxc-utils \
        lxc-templates \
        uml-utilities \
        ebtables \
        bridge-utils \
        libboost-all-dev \ 
        ccache \
        qt5-qmake \ 
        qtbase5-dev \ 
        qtbase5-dev-tools \ 
        libqt5svg5-dev \
        libqt5webenginewidgets5 \
        libqt5webchannel5-dev \
        qtwebengine5-dev

RUN mkdir -p /usr/ns3
WORKDIR /usr 

RUN wget https://www.nsnam.org/release/ns-allinone-3.43.tar.bz2  && \
    tar -jxvf ns-allinone-3.43.tar.bz2 && \
    cd /usr/ns-allinone-3.43/ns-3.43/contrib && \
    git clone https://github.com/sns3/sns3-satellite.git satellite && \
    git clone https://github.com/sns3/traffic.git traffic && \
    git clone https://github.com/sns3/stats.git magister-stats

RUN cd ns-allinone-3.43 && ./build.py --enable-examples 

RUN ln -s /usr/ns-allinone-3.43/ns-3.43/ /usr/ns3/

RUN apt-get clean && \
    rm -rf /var/lib/apt && \
    rm ns-allinone-3.43.tar.bz2 && \
    cd /usr/ns3/ns-3.43/contrib/satellite && \
    git submodule update --init --recursive 
