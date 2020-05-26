FROM osrf/ros:melodic-desktop-full

RUN apt-get update && apt-get install sudo

# ==============================================================================
#                    Set up a user mirroring the Host
# ==============================================================================
ARG HOST_USER
ARG HOST_UID
# dialout group is used for compatability with mac
ARG HOST_GROUP=dialout

# create user and set password
RUN useradd \
        -r \
        -m \
        -d /home/${HOST_USER}/ \
        -u ${HOST_UID} \
        -g ${HOST_GROUP} \
        -G sudo,video,audio \
        ${HOST_USER} && \
    echo ${HOST_USER}:password | chpasswd


# set workdir to workspace
WORKDIR /home/${HOST_USER}