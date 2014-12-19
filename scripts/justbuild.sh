#!/bin/sh -ex
ant -Dforrest.home=/opt/apache-forrest-0.9 -Dant.home=/opt/apache-ant-1.8.4/ -Dversion=${ARTIFACT_VERSION} -Dhadoopversion=23 clean jar-h12
pushd contrib/piggybank/java
ant -Dhadoopversion=23
popd
ant -Dforrest.home=/opt/apache-forrest-0.9 -Dant.home=/opt/apache-ant-1.8.4/ -Dversion=${ARTIFACT_VERSION} -Dhadoopversion=23 tar-h12
