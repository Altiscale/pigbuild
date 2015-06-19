#!/bin/sh -ex
ant -Dforrest.home=/opt/apache-forrest-0.9 -Dant.home=/opt/apache-ant-1.8.4/ -Dversion=${ARTIFACT_VERSION} -Dhadoopversion=23 clean jar 
