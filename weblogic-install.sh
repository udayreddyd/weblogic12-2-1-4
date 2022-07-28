# JDK & Weblogic 12.2.1.4 installation
sudo groupadd -g 54321 oci_fmw
sudo useradd -u 54321 -g oci_fmw oci_fmw
sudo su - oci_fmw
sudo git yuminstall -y
git clone weblogic12c-setup-files
sudo tar -xvf jdk-8u241-linux-x64.tar.gz 
sudo mkdir -p /usr/java
sudo mv jdk1.8.0_241 /usr/java/
sudo alternatives --install /usr/bin/java java /usr/java/jdk1.8.0_241/bin/java 1
sudo alternatives --config java
java -version
mkdir -p /home/oci_fmw/oracle/middleware
mkdir -p /home/oci_fmw/config/domains
mkdir -p /home/oci_fmw/oracle/config/applications
mkdir -p /home/oci_fmw/software
chown -R oci_fmw:oci_fmw /home/oci_fmw/oracle/middleware  /home/oci_fmw/config/domains /home/oci_fmw/oracle/config/applications /home/oci_fmw/software
chmod -R 775 /home/oci_fmw/oracle/middleware  /home/oci_fmw/config/domains /home/oci_fmw/oracle/config/applications /home/oci_fmw/software
touch /home/oci_fmw/.bash_profile
echo "export MW_HOME=/u01/app/oracle/middleware" > /home/oci_fmw/.bash_profile
echo "export WLS_HOME=$MW_HOME/wlserver" >> /home/oci_fmw/.bash_profile
echo "export WL_HOME=$WLS_HOME" >> /home/oci_fmw/.bash_profile
echo "export PATH=$JAVA_HOME/bin:$PATH" >> /home/oci_fmw/.bash_profile
cd /home/oci_fmw/software/
git
touch /home/oci_fmw/software/wls.rsp

[ENGINE]
Response File Version=1.0.0.0.0
[GENERIC]
ORACLE_HOME=/home/oci_fmw/oracle/middleware
INSTALL_TYPE=WebLogic Server
MYORACLESUPPORT_USERNAME=
MYORACLESUPPORT_PASSWORD=<SECURE VALUE>
DECLINE_SECURITY_UPDATES=true
SECURITY_UPDATES_VIA_MYORACLESUPPORT=false
PROXY_HOST=
PROXY_PORT=
PROXY_USER=
PROXY_PWD=<SECURE VALUE>
COLLECTOR_SUPPORTHUB_URL=

vi /u01/software/oraInst.loc

inventory_loc=/home/opc/oraInventory
inst_group=oinstall
