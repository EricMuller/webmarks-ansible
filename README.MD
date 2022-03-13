

##  ANSIBLEPLAY-BOOK for CENTOS 7 and Python 2 

cuz yum... dont work with python3 ... 

Only playbook No role , no time...

ssh root@94.23.251.82 

## Client ansible

#### Setup config ssh 

> ssh-keygen
 
> ssh-copy-id root@94.23.251.82

> ssh-copy-id root@192.168.1.10

##### Setup lib ansible:

> sudo yum install ansible
> ansible-galaxy collection list
> ansible-galaxy collection install ansible.posix
- alternative 
> ansible-galaxy collection install community.general
- docker
> ansible-galaxy collection install community.docker
- postgres
> ansible-galaxy collection install community.postgresql
> PRIVATE KEY
> ansible-galaxy collection install community.crypto

##### test host config 
> vi /etc/ansible/hosts
> ansible all -m ping
>
##### Wsl explorer under centos
\\wsl$


# Setup Remote Host 

Install pip

> curl "https://bootstrap.pypa.io/pip/2.7/get-pip.py" -o "get-pip.py"
>  python2.7 get-pip.py


# launch Playbook On Remote Platforms

##### Push some Httpd and some stuff on remote 

> ansible-playbook multiplay-install-01.yaml -l dev

Génerate with certbot certificates certbot on remote host

**Warn :  must be done without playbook**
> certbot --apache -d centos7-dev.webmarks.net -d keycloak-dev.webmarks.net -d nexus-dev.webmarks.net -d jenkins-dev.webmarks.net -d sonarqube-dev.webmarks.net -d qcm-dev.webmarks.net
   
> certbot --apache -d centos7.webmarks.net -d keycloak.webmarks.net -d nexus.webmarks.net -d jenkins.webmarks.net -d sonarqube.webmarks.net -d qcm.webmarks.net

##### Push context Https
> ansible-playbook multiplay-install-02.yaml -l dev

##### Push application docker
> ansible-playbook multiplay-install-02.yaml -l dev



# MEMO 

#### issue with python docker lib docker and certbot

restore system 2.7
> pip uninstall requests urllib3 &&   yum -y reinstall python-chardet python-urllib3 &&  yum -y install python-requests && yum remove certbot python2-certbot

python3 -m venv env
python -m virtualenv env #py2
source env/bin/activate

#### launch playbook with python3

> ansible-playbook plaxxxx.yaml  -e 'ansible_python_interpreter=/usr/bin/python3'

#### launch playbook

> ansible-playbook mytask.yaml -l dev 

# docker password

docker exec -it nexus-srv bash
cat /nexus-data/admin.password

#lets encript

yum install epel-release
yum install certbot python2-certbot-apache mod_ssl

# cerbot dev

certbot certificates

sudo certbot delete --cert-name $mydomain

certbot --apache -d centos7-dev.webmarks.net -d keycloak-dev.webmarks.net -d nexus-dev.webmarks.net -d jenkins-dev.webmarks.net -d sonarqube-dev.webmarks.net -d qcm-dev.webmarks.net

# cerbot  prod

certbot certificates
certbot renew --dry-run
crontab -e
* */12 * * * root /usr/bin/certbot renew >/dev/null 2>&1

# tools

sudo ngrep -W byline "GET|POST HTTP" -d eth0 port 8081

docker volume ls -qf dangling=true | xargs -r docker volume rm

## openssl

view detail certificate:
openssl x509 -text -in VotreCertificat.crt -noout

private key:
openssl rsa -noout -modulus -in server.key | md5sum
certificate :
openssl x509 -noout -modulus -in server.crt | md5sum

Si le résultat est le même pour les deux commandes, alors la clé privée et le certificat
sont bien pour le même nom de domaine, avec les mêmes caractéristiques (validité…)






