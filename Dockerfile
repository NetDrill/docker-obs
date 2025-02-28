FROM bandi13/gui-docker:1.01

RUN export DEBIAN_FRONTEND=noninteractive \
    && apt-get update -y \
    && apt-get install -y software-properties-common \
    && add-apt-repository ppa:obsproject/obs-studio \
    && apt-get update -y \
    && apt-get install -y obs-studio pulseaudio-utils \
    && apt-get clean -y

# Configure PulseAudio client
RUN mkdir -p /etc/pulse
RUN echo "default-server = unix:/tmp/pulseaudio.socket" > /etc/pulse/client.conf \
    && echo "autospawn = no" >> /etc/pulse/client.conf \
    && echo "daemon-binary = /bin/true" >> /etc/pulse/client.conf \
    && echo "enable-shm = false" >> /etc/pulse/client.conf

RUN echo "?package(bash):needs=\"X11\" section=\"DockerCustom\" title=\"OBS Screencast\" command=\"obs\"" >> /usr/share/menu/custom-docker && update-menus