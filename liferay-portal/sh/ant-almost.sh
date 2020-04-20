#!/bin/sh

set -o errexit ; set -o nounset


#
function modify_build_xml()
{
cd ${LIFERAY_PORTAL_DIR}/modules

cp ../modules/build-almost.xml ${LIFERAY_PORTAL_DIR}/modules

cp build.xml build.xml.original

cat build.xml.original | \
sed -e 's/path id="plugins.includes.path"/path id="plugins.includes.path.original"/g' | \
sed -e 's/<project>/<project><import file="build-almost.xml" \/>/g' > build.xml

cd -
}
#


#
function restore_build_xml()
{
cd ${LIFERAY_PORTAL_DIR}/modules

mv build.xml.original build.xml

rm build-almost.xml

cd -
}
#


#
function remove_node_modules()
{
rm -rf ${LIFERAY_PORTAL_DIR}/modules/apps/wiki/wiki-web/node_modules/
rm -rf ${LIFERAY_PORTAL_DIR}/modules/apps/frontend-editor/frontend-editor-alloyeditor-web/node_modules/
rm -rf ${LIFERAY_PORTAL_DIR}/modules/apps/frontend-js/frontend-js-metal-web/node_modules/
rm -rf ${LIFERAY_PORTAL_DIR}/modules/apps/hello-soy/hello-soy-web/node_modules/
rm -rf ${LIFERAY_PORTAL_DIR}/modules/apps/frontend-theme-fjord/frontend-theme-fjord/node_modules/
}
#


#
function remove_lfrbuildportal() 
{
subdir=$1

figlet -f digital .lfrbuild-portal OFF $subdir || true

cd ${LIFERAY_PORTAL_DIR}/$subdir
pwd

#mv .lfrbuild-portal .lfrbuild-portal.ORIGINAL || true
mv .lfrbuild-portal.ORIGINAL .lfrbuild-portal || true


cd -
}
#


#
function skip_modules_lfrbuildportal()
{
remove_lfrbuildportal modules/apps/collaboration/wiki/wiki-web
remove_lfrbuildportal modules/apps/frontend-theme-porygon/frontend-theme-porygon

remove_lfrbuildportal modules/apps/frontend-theme-1975-london/frontend-theme-1975-london
remove_lfrbuildportal modules/apps/frontend-theme-fjord/frontend-theme-fjord
remove_lfrbuildportal modules/apps/frontend-theme-westeros-bank/frontend-theme-westeros-bank
}
#


################


#### modify_build_xml

remove_node_modules

#### skip_modules_lfrbuildportal


./ant-all.sh
