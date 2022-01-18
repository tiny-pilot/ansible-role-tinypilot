FROM balenalib/raspberry-pi:buster

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    libmicrohttpd-dev \
    libjansson-dev \
    libssl-dev \
    libsrtp-dev \
    libsofia-sip-ua-dev \
    libglib2.0-dev \
    libopus-dev \
    libogg-dev \
    libcurl4-openssl-dev \
    liblua5.3-dev \
    libconfig-dev \
    pkg-config \
    gengetopt \
    libtool \
    automake \
    cmake \
    make \
    wget \
    git \
    build-essential \
    ninja-build \
    python3 \
    python3-pip \
    # ustreamer dependencies. adding libraspberrypi-dev to enable WITH_OMX=1 on ustreamer
    libevent-dev \
    libjpeg8-dev \
    libbsd-dev \
    libraspberrypi-dev

RUN pip3 install meson

# libince is recommended to be installed from source because the version installed via apt is too low
RUN git clone https://gitlab.freedesktop.org/libnice/libnice && \
    cd libnice && \
    meson --prefix=/usr build && ninja -C build && sudo ninja -C build install

RUN wget https://github.com/cisco/libsrtp/archive/v2.2.0.tar.gz && \
    tar xfv v2.2.0.tar.gz && \
    cd libsrtp-2.2.0 && \
    ./configure --prefix=/usr --enable-openssl && \
    make shared_library && sudo make install

RUN git clone https://libwebsockets.org/repo/libwebsockets && \
    cd libwebsockets && \
    # If you want the stable version of libwebsockets, uncomment the next line
    # git checkout v3.2-stable && \
    mkdir build && \
    cd build && \
    # See https://github.com/meetecho/janus-gateway/issues/732 re: LWS_MAX_SMP
    # See https://github.com/meetecho/janus-gateway/issues/2476 re: LWS_WITHOUT_EXTENSIONS
    cmake -DLWS_MAX_SMP=1 -DLWS_WITHOUT_EXTENSIONS=0 -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_C_FLAGS="-fpic" .. && \
    make && sudo make install

RUN git clone https://github.com/meetecho/janus-gateway.git && \
    cd janus-gateway && \
    sh autogen.sh && \
    # we didn't install the dependencies (nor are they needed) for the disabled parts
    ./configure --prefix=/opt/janus --disable-data-channels --disable-rabbitmq --disable-mqtt && \
    make && make install

RUN ln -s /opt/janus/include/janus /usr/include/janus && \
    # this is sort of a hack so that the ustreamer janus plugin compilation works
    # it just points the dependency to being in the parent folder
    sed -i -e 's|^#include "refcount.h"$|#include "../refcount.h"|g' "/usr/include/janus/plugins/plugin.h"

RUN git clone --depth=1 https://github.com/pikvm/ustreamer && \
    cd ustreamer && \
    make WITH_OMX=1 WITH_JANUS=1 && \
    mv /ustreamer/janus/libjanus_ustreamer.so /opt/janus/lib/janus/plugins/libjanus_ustreamer.so

COPY janus.plugin.ustreamer.jcfg /opt/janus/lib/janus/configs/janus.plugin.ustreamer.jcfg
COPY janus.transport.websockets.jcfg /opt/janus/lib/janus/configs/janus.transport.websockets.jcfg
COPY start.sh /start.sh

ENTRYPOINT ["bash", "./start.sh"]
