function property_set()
{
	PROPERTY_NAME=$1
	PROPERTY_VALUE=$2
	PROPERTIES_FILE=$3

	sed -e "s|^${PROPERTY_NAME}=[^ ]*|${PROPERTY_NAME}=${PROPERTY_VALUE}|g" -i bak ${PROPERTIES_FILE}
}

function tomcat_debug()
{
	LPORTAL_DATABASE=$1
	TOMCAT_DIR=$2

	property_set    jdbc.default.url     jdbc:mysql://localhost/${LPORTAL_DATABASE}?useUnicode=true\\\&characterEncoding=UTF-8\\\&useFastDateParsing=false\\\&serverTimezone=GMT     ${TOMCAT_DIR}/../portal-ext.properties
	# ${TOMCAT_DIR}/webapps/ROOT/WEB-INF/classes/portal-ext.properties

	cd ${TOMCAT_DIR}
	bin/catalina.sh jpda run
}
