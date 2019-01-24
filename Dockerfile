# -----------------------------------------------------------------------------
# docker-ansible
#
# Builds a basic docker image that can run ansible / ansible-lint
# (http://ansible.com/).
#
# Author: ntimo (https://github.com/ntimo)
# Require: Docker (http://www.docker.io/)
# -----------------------------------------------------------------------------

# Base system is Ubuntu 18.04
FROM   ubuntu:bionic

LABEL name="Ansible" \
      version="2.7"

# Download and install everything from the repos.
RUN    DEBIAN_FRONTEND=noninteractive \
        apt-get -y update && \
        apt-get -y install bzip2 ca-certificates && \
        apt-get -y install python-pip python-dev build-essential && \
        apt-get -y install libssl-dev libcurl4-gnutls-dev libexpat1-dev gettext unzip git && \
        rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
        apt-get autoremove -y && \
        apt-get clean

# Download and install Ansible
RUN    pip install --upgrade ansible && \
       pip install --upgrade ansible-lint
