#!/bin/sh -ex
export RPM_VERSION=0.1.0
export RPM_NAME=`echo vcc-pig-${ARTIFACT_VERSION}`
echo "Building Pig Version RPM ${RPM_NAME} with RPM version ${RPM_VERSION}-${DATE_STRING}"


export RPM_BUILD_DIR=${INSTALL_DIR}/opt
mkdir --mode=0755 -p ${RPM_BUILD_DIR}
cd ${RPM_BUILD_DIR}
tar -xvzpf ${WORKSPACE}/build/pig-${ARTIFACT_VERSION}.tar.gz

cd ${RPM_DIR}
fpm --verbose \
--maintainer ops@verticloud.com \
--vendor VertiCloud \
--provides ${RPM_NAME} \
--replaces vcc-pig_${ARTIFACT_VERSION} \
-s dir \
-t rpm \
-n ${RPM_NAME} \
-v ${RPM_VERSION} \
--iteration ${DATE_STRING} \
--rpm-user root \
--rpm-group root \
-C ${INSTALL_DIR} \
opt
