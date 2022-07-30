# JDK & Weblogic 12.2.1.4 installation
sudo su - opc
sudo -ivh /home/opc/jdk-8u341-linux-x64.rpm
sudo mkdir -p /usr/java
sudo mv jdk1.8.0_341 /usr/java/
sudo alternatives --install /usr/bin/java java /usr/java/jdk1.8.0_341/bin/java 1
sudo alternatives --config java
java -version
mkdir -p /home/opc/oracle/middleware
mkdir -p /home/opc/config/domains
mkdir -p /home/opc/oracle/config/applications
mkdir -p /home/opc/software
chown -R opc:opc /home/opc/oracle/middleware  /home/opc/config/domains /home/opc/oracle/config/applications /home/opc/software
chmod -R 775 /home/opc/oracle/middleware  /home/opc/config/domains /home/opc/oracle/config/applications /home/opc/software
touch /home/opc/.bash_profile
echo "export MW_HOME=/home/opc/oracle/middleware" > /home/opc/.bash_profile
echo "export WLS_HOME=$MW_HOME/wlserver" >> /home/opc/.bash_profile
echo "export WL_HOME=$WLS_HOME" >> /home/opc/.bash_profile
echo "export PATH=$JAVA_HOME/bin:$PATH" >> /home/opc/.bash_profile
cd /home/opc/weblogic12c/

# Response file for silent instllations
sudo cp /home/opc/weblogic12c/wls.rsp /home/opc/software/
sudo cp /home/opc/weblogic12c/oraInst.loc /home/opc/

##Install weblogic12c
inventory_loc=/home/opc/oraInventory
WLS_PATH=/home/opc/fmw_12.2.1.4.0_wls_lite_generic.jar
RESPONSE_FILE=/home/opc/wls.rsp
ORACLE_INVENTORY_LOCATION=/home/opc/oraInst.loc
sudo java -jar $WLS_PATH -silent -responseFile $RESPONSE_FILE -invPtrLoc $ORACLE_INVENTORY_LOCATION

