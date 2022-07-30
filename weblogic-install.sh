# JDK & Weblogic 12.2.1.4 installation
sudo groupadd -g 54321 opc
sudo useradd -u 54321 -g opc opc
sudo su - opc
sudo -ivh jdk-8u241-linux-x64.rpm
sudo mkdir -p /usr/java
sudo mv jdk1.8.0_241 /usr/java/
sudo alternatives --install /usr/bin/java java /usr/java/jdk1.8.0_241/bin/java 1
sudo alternatives --config java
java -version
mkdir -p /home/opc/oracle/middleware
mkdir -p /home/opc/config/domains
mkdir -p /home/opc/oracle/config/applications
mkdir -p /home/opc/software
chown -R opc:opc /home/opc/oracle/middleware  /home/opc/config/domains /home/opc/oracle/config/applications /home/opc/software
chmod -R 775 /home/opc/oracle/middleware  /home/opc/config/domains /home/opc/oracle/config/applications /home/opc/software
touch /home/opc/.bash_profile
echo "export MW_HOME=/u01/app/oracle/middleware" > /home/opc/.bash_profile
echo "export WLS_HOME=$MW_HOME/wlserver" >> /home/opc/.bash_profile
echo "export WL_HOME=$WLS_HOME" >> /home/opc/.bash_profile
echo "export PATH=$JAVA_HOME/bin:$PATH" >> /home/opc/.bash_profile
cd /home/opc/software/

# Response file for silent instllations
sudo cp /home/opc/weblogic12c/wls.rsp /home/opc/software/


## Inventory file
echo "inventory_loc=/home/opc/oraInventory" >> /home/opc/software/oraInst.loc
echo "inst_group=oinstall" >> /home/opc/software/oraInst.loc

