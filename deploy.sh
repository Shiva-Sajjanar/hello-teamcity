#!/bin/bash

echo "Starting deployment..."

WAR_FILE="target/hello-teamcity.war"
TOMCAT_WEBAPPS="/opt/tomcat/webapps"

echo "Checking WAR file..."

if [ ! -f "$WAR_FILE" ]; then
    echo "ERROR: WAR file not found!"
    exit 1
fi

echo "WAR file found."

echo "Stopping Tomcat..."
/opt/tomcat/bin/shutdown.sh

sleep 5

echo "Removing old application..."
rm -rf "$TOMCAT_WEBAPPS/hello-teamcity"
rm -f "$TOMCAT_WEBAPPS/hello-teamcity.war"

echo "Copying new WAR..."
cp "$WAR_FILE" "$TOMCAT_WEBAPPS/hello-teamcity.war"

echo "Starting Tomcat..."
/opt/tomcat/bin/startup.sh

echo "Deployment completed successfully!"
