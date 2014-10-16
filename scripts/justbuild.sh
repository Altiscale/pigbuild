#!/bin/sh -ex
ant -Dforrest.home=/opt/apache-forrest-0.9 -Dant.home=/opt/apache-ant-1.8.4/ -Dversion=${ARTIFACT_VERSION} -Dhadoopversion=23 clean jar jar-withouthadoop
pushd contrib/piggybank/java
ant -Dhadoopversion=23
popd
# For oozie compatability, oozie start script doesn't expect appended "-h2"
mv pig-${ARTIFACT_VERSION}-h2.jar pig-${ARTIFACT_VERSION}.jar
mv pig-${ARTIFACT_VERSION}-withouthadoop-h2.jar pig-${ARTIFACT_VERSION}-withouthadoop.jar
ant -Dforrest.home=/opt/apache-forrest-0.9 -Dant.home=/opt/apache-ant-1.8.4/ -Dversion=${ARTIFACT_VERSION} -Dhadoopversion=23 tar
