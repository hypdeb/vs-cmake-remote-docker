FROM ubuntu:latest
RUN apt-get update
RUN apt-get install -y \
    wget \
    lsb-core \
    software-properties-common
RUN wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add -
RUN wget https://apt.llvm.org/llvm.sh
RUN chmod +x llvm.sh
RUN ./llvm.sh 9

RUN wget https://github.com/Kitware/CMake/releases/download/v3.16.4/cmake-3.16.4.tar.gz
RUN tar -xf cmake-3.16.4.tar.gz
WORKDIR /cmake-3.16.4
RUN apt-get install -y \
    libssl-dev
RUN ./bootstrap
RUN make
RUN make install
WORKDIR /

# configure ssh for communication with VS
RUN apt-get install -y \
    rsync \
    openssh-server \
    zip
RUN mkdir -p /var/run/sshd
RUN echo 'PasswordAuthentication yes' >> /etc/ssh/sshd_config && \
   ssh-keygen -A
RUN useradd -m -d /home/dev -s /bin/bash -G sudo dev
RUN echo dev:dev | chpasswd

# installing gdb
RUN apt-get install -y gdb

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]