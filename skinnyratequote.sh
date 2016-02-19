#!/bin/sh
# # # # # # # # # # # # # # # # # # # # # # # # # # # #
#                                                     #
# Created By John Williams Tel 510.393.1660           #
# Date 07/16/20015                                    #
#                                                     #
# # # # # # # # # # # # # # # # # # # # # # # # # # # #

DATE=`/bin/date +%m%d%y`
LOG="/tmp/deployment.log"

echo starting The Deployment...

sleep 5

service tomcat stop

sleep 5

echo Backing up the old war file and deploying the new file...

rm -rf /home/kkadmin/NMISync.war.bk*

cd /usr/share/apache-tomcat-7.0.42/webapps/

mv  NMISync.war /home/kkadmin/NMISync.war.bk.${DATE}

rm -rf NMISync

cp  /home/kkadmin/erq/war/NMISync.war .

echo Backing up the old Conf folder and deploying the new Conf folder...

sleep 5

cd /opt/axis/ratefinder

mv conf /home/kkadmin/conf.bk.${DATE}

cp -r /home/kkadmin/erq/conf .

echo You might need to update the build number in main.js after Tomcat starts...

echo Changing the build number now...

sleep 5

sed -i '/buildNo=/s/4.0.0.0/5.0.0.70/g' /opt/axis/ratefinder/conf/common/properties/environment.properties |grep build

echo Starting Tomcat...

#service tomcat start

echo Checking the Tomcat log now! do you see any errors?...

sleep 5

#tail -f /usr/share/apache-tomcat-7.0.42/logs/catalina.out
