#!/bin/sh -ex
ALTISCALE_RELEASE=${ALTISCALE_RELEASE:-0.1.0}
RPM_DESCRIPTION="Apache Pig ${ARTIFACT_VERSION}\n\n${DESCRIPTION}"

export RPM_NAME=`echo alti-pig-${ARTIFACT_VERSION}`
echo "Building Pig Version RPM ${RPM_NAME} with RPM version ${ALTISCALE_VERSION}-${DATE_STRING}"


export RPM_BUILD_DIR=${INSTALL_DIR}/opt
mkdir --mode=0755 -p ${RPM_BUILD_DIR}
cd ${RPM_BUILD_DIR}
tar -xvzpf ${WORKSPACE}/pig/build/pig-${ARTIFACT_VERSION}.tar.gz

cd ${RPM_DIR}
fpm --verbose \
--maintainer support@altiscale.com \
--vendor Altiscale \
--provides ${RPM_NAME} \
--description "${RPM_DESCRIPTION}" \
--replaces alti-pig_${ARTIFACT_VERSION} \
--url ${GITREPO} \
--license "Apache License v2" \
-s dir \
-t rpm \
-n ${RPM_NAME} \
-v ${ALTISCALE_RELEASE} \
--iteration ${DATE_STRING} \
--rpm-user root \
--rpm-group root \
-C ${INSTALL_DIR} \
opt
