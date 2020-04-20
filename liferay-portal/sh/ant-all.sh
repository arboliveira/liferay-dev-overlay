#!/bin/sh

set -o errexit ; set -o nounset


#
function modify_build_xml()
{
cd ${LIFERAY_PORTAL_DIR}

cp build.xml build.original.xml

cat build.original.xml | \
sed -e 's/git clean -df/# git clean -df/g' > build.xml

rm build.original.xml

cd -
}
#


################


# modify_build_xml

cd ${LIFERAY_PORTAL_DIR}

figlet ant setup-profile-dxp || true

ant setup-profile-dxp

figlet Keep calm and ANT ALL || true

CLEAN_NODE_MODULES=false

if [ "$CLEAN_NODE_MODULES" = false ]
then
	ant all
else
	ant all -Dclean.node.modules=true
fi

figlet compile-test || true

ant compile-test

mkdir ${LIFERAY_BUNDLES_PORTAL_DIR}/osgi/log4j
