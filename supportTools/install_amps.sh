#!/bin/bash
docker cp support-tools-repo-1.2.2.0-amp.amp alfrescodemocontainer-alfresco-1:/usr/local/tomcat/amps


Docker cp support-tools-share-1.2.2.0-amp.amp alfrescodemocontainer-share-1:/usr/local/tomcat/amps_share


docker exec -it --user root alfrescodemocontainer-alfresco-1 bash -c "java -jar /usr/local/tomcat/alfresco-mmt/alfresco-mmt-23.4.0.67.jar install /usr/local/tomcat/amps /usr/local/tomcat/webapps/alfresco -directory -nobackup -force"

docker exec -it --user root alfrescodemocontainer-share-1 bash -c "java -jar /usr/local/tomcat/alfresco-mmt/alfresco-mmt-23.4.0.67.jar install /usr/local/tomcat/amps_share /usr/local/tomcat/webapps/share -directory -nobackup -force"