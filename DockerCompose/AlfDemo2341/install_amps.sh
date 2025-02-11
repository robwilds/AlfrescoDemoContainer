#!/bin/bash
docker cp ../../supportTools/support-tools-repo-1.2.2.0-amp.amp alfdemo2341-alfresco-1:/usr/local/tomcat/amps


Docker cp ../../supportTools/support-tools-share-1.2.2.0-amp.amp alfdemo2341-share-1:/usr/local/tomcat/amps_share


docker exec -it --user root alfdemo2341-alfresco-1 bash -c "java -jar /usr/local/tomcat/alfresco-mmt/alfresco-mmt-23.4.1.1.jar install /usr/local/tomcat/amps /usr/local/tomcat/webapps/alfresco -directory -nobackup"

docker exec -it --user root alfdemo2341-share-1 bash -c "java -jar /usr/local/tomcat/alfresco-mmt/alfresco-mmt-23.4.1.1.jar install /usr/local/tomcat/amps_share /usr/local/tomcat/webapps/share -directory -nobackup"