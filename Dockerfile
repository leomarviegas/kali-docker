############################################
# Kali Linux (Rolling) Docker Image        #
# 2021                                     #
############################################
# Author: Leomar Viegas Junior             #
# Version: 0.1                             #
############################################

FROM kalilinux/kali-rolling

# Let the container know there will be no TTY
ENV DEBIAN_FRONTEND=noninteractive

# From the upstream docker image
#RUN echo "deb http://http.kali.org/kali kali-rolling main contrib non-free" > /etc/apt/sources.list && \
#    echo "deb-src http://http.kali.org/kali kali-rolling main contrib non-free" >> /etc/apt/sources.list

# Get the latest everything
RUN apt-get -y update && \
    apt-get -y dist-upgrade 

# Install tools we want
RUN apt-get install -y \
    hydra \
    john \
    metasploit-framework \
    nmap \
    sqlmap \
    wfuzz \
    exploitdb \
    nikto \
    commix \
    hashcat \
	zaproxy \
	kali-linux-web \
	kali-linux-headless \
    # Wordlists
    wordlists \ 
    cewl

# Install Other tools
RUN apt-get install -y \
    gdb

# Install utils
RUN apt-get install -y \
    vim \
    git

# Setup gdb-peda
RUN git clone https://github.com/longld/peda.git ~/peda && \
    echo "source ~/peda/peda.py" >> ~/.gdbinit

CMD ["/bin/bash"]
