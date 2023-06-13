FROM centos:8

# Set source
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
COPY --chown=root CentOS-Base.repo /etc/yum.repos.d/

# Install packages
RUN yum -y update && yum clean all
RUN yum -y install git cmake gcc gcc-c++ curl
RUN dnf -y --enablerepo=PowerTools install ninja-build

# Install Node js
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
RUN bash -c 'source $HOME/.nvm/nvm.sh && nvm install 14.16.0'

# Copy compile script
COPY --chown=root entrypoint.sh /

# /git is used to store project source code
RUN mkdir /git
VOLUME /git

# /root/.hunter is used to store hunter cache
RUN mkdir /root/.hunter
VOLUME /root/.hunter

ENTRYPOINT bash -c 'source $HOME/.nvm/nvm.sh && /entrypoint.sh'
