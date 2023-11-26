#!/bin/sh

sudo swapoff -a


sudo ufw enable
 
sudo ufw allow ssh
sudo ufw allow 6443/tcp
sudo ufw allow 2379/tcp
sudo ufw allow 2380/tcp
sudo ufw allow 10250/tcp
sudo ufw allow 10259/tcp
sudo ufw allow 10257/tcp



# cri-o installation  # Source link:https://scriptcrunch.com/install-cri-o-ubuntu/

# Source link: https://www.linuxtechi.com/install-crio-container-runtime-on-ubuntu/ 

# Installing and updating dependencies
sudo apt-get update
sudo apt-get update apt-transport-https ca-certificates curl gnupg2 \
    software-properties-common -y

# Adding cri-o repository
OS="xUbuntu_22.04"
VERSION="1.28"

echo "deb https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/$OS/ /" | sudo tee /etc/apt/sources.list.d/devel:kubic:libcontainers:stable.list
echo "deb http://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable:/cri-o:/$VERSION/$OS/ /" | sudo tee /etc/apt/sources.list.d/devel:kubic:libcontainers:stable:cri-o:$VERSION.list

curl -L https://download.opensuse.org/repositories/devel:kubic:libcontainers:stable:cri-o:$VERSION/$OS/Release.key | sudo apt-key --keyring /etc/apt/trusted.gpg.d/libcontainers.gpg add -
curl -L https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/$OS/Release.key | sudo apt-key --keyring /etc/apt/trusted.gpg.d/libcontainers.gpg add -

sudo apt-get update
sudo apt-get install cri-o cri-o-runc cri-tools -y

sudo systemctl daemon-reload
sudo systemctl enable crio --now

sudo apt-get install -y runc

# https://github.com/cri-o/cri-o/blob/main/install.md#install-packaged-versions-of-cri-o

apt-get update -qq && apt-get install -y \
  libbtrfs-dev \
  containers-common \
  git \
  libassuan-dev \
  libdevmapper-dev \
  libglib2.0-dev \
  libc6-dev \
  libgpgme-dev \
  libgpg-error-dev \
  libseccomp-dev \
  libsystemd-dev \
  libselinux1-dev \
  pkg-config \
  go-md2man \
  cri-o-runc \
  libudev-dev \
  software-properties-common \
  gcc \
  make

#!/bin/sh

sudo swapoff -a


sudo ufw enable
 
sudo ufw allow ssh
sudo ufw allow 6443/tcp
sudo ufw allow 2379/tcp
sudo ufw allow 2380/tcp
sudo ufw allow 10250/tcp
sudo ufw allow 10259/tcp
sudo ufw allow 10257/tcp



# cri-o installation  # Source link:https://scriptcrunch.com/install-cri-o-ubuntu/

# Source link: https://www.linuxtechi.com/install-crio-container-runtime-on-ubuntu/ 

# Installing and updating dependencies
sudo apt-get update
sudo apt-get update apt-transport-https ca-certificates curl gnupg2 \
    software-properties-common -y

# Adding cri-o repository
OS="xUbuntu_22.04"
VERSION="1.28"

echo "deb https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/$OS/ /" | sudo tee /etc/apt/sources.list.d/devel:kubic:libcontainers:stable.list
echo "deb http://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable:/cri-o:/$VERSION/$OS/ /" | sudo tee /etc/apt/sources.list.d/devel:kubic:libcontainers:stable:cri-o:$VERSION.list

curl -L https://download.opensuse.org/repositories/devel:kubic:libcontainers:stable:cri-o:$VERSION/$OS/Release.key | sudo apt-key --keyring /etc/apt/trusted.gpg.d/libcontainers.gpg add -
curl -L https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/$OS/Release.key | sudo apt-key --keyring /etc/apt/trusted.gpg.d/libcontainers.gpg add -

sudo apt-get update
sudo apt-get install cri-o cri-o-runc cri-tools -y

sudo systemctl daemon-reload
sudo systemctl enable crio --now

sudo apt-get install -y runc

# https://github.com/cri-o/cri-o/blob/main/install.md#install-packaged-versions-of-cri-o

apt-get update -qq && apt-get install -y \
  libbtrfs-dev \
  containers-common \
  git \
  libassuan-dev \
  libdevmapper-dev \
  libglib2.0-dev \
  libc6-dev \
  libgpgme-dev \
  libgpg-error-dev \
  libseccomp-dev \
  libsystemd-dev \
  libselinux1-dev \
  pkg-config \
  go-md2man \
  cri-o-runc \
  libudev-dev \
  software-properties-common \
  gcc \
  make

mv


  