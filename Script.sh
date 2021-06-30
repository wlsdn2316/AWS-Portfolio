#!/bin/bash
echo -e "============================================================"
echo -e "                [DB Shell script]"
echo -e "============================================================"

echo -e " DB인스턴스의 엔드포인트를 입력해주세요 "
read DB_ENDPOINT

echo -e " DB인스턴스의  마스터 사용자 이름을 입력해주세요"
read DB_MASTER

echo -e " DB인스턴스의 마스터 암호를 입력해주세요 "
read DB_PASSWORD

sudo sed -i 's/jjwmasterdb.chabsh0zrlyl.ap-northeast-2.rds.amazonaws.com/'$DB_ENDPOINT'/' /server/was/instances/center/conf/server.xml
sudo sed -i 's/jinwoo/'$DB_MASTER'/' /server/was/instances/center/conf/server.xml
sudo sed -i 's/jt201wdb/'$DB_PASSWORD'/' /server/was/instances/center/conf/server.xml
sudo yum install -y java-1.8.0-openjdk-devel.x86_64
sudo echo JAVA_HOME=/etc/alternatives/java_sdk >> /etc/profile 
sudo echo 'CLASSPATH=.:$JAVA_HOME/lib/tools.jar' >> /etc/profile 
sudo echo PATH='$PATH:$JAVA_HOME/bin' >> /etc/profile 
sudo echo CATALINA_HOME=/server/was/tomcat8 >> /etc/profile 
sudo echo export JAVA_HOME CLASSPATH PATH CATALINA_HOME >> /etc/profile 
sudo echo 'LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$CATALINA_HOME/lib' >> /etc/profile 
sudo echo export LD_LIBRARY_PATH >> /etc/profile
sudo useradd tomcat
sudo chown -R tomcat:tomcat /server
su - tomcat -c /server/was/launcher/startup_center.sh            


