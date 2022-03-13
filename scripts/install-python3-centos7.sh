

sudo yum -y install epel-release

sudo yum -y update

sudo reboot

sudo yum -y groupinstall "Development Tools"

sudo yum -y install openssl-devel bzip2-devel libffi-devel xz-devel

sudo yum -y install wget

wget https://www.python.org/ftp/python/3.8.12/Python-3.8.12.tgz

tar xvf Python-3.8.12.tgz

cd Python-3.8*/

./configure --enable-optimizations

sudo make altinstall

python3.8 --version

pip3.8 --version


# update link

ln -s /usr/local/bin/python3.8 /usr/bin/python3

ln -s /usr/local/bin/pip3.8 /usr/bin/pip3

#rm -i  /usr/bin/python

#ln -s /usr/bin/python3  /usr/bin/python

#ln -s /usr/bin/pip3  /usr/bin/pip





