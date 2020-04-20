figlet -f digital -w 240 source fn-gradlew.sh || true

function degradlew()
{
	:
	#mv settings.gradle settings.gradle.ORIGINAL || true
	#mv ../settings.gradle ../settings.gradle.ORIGINAL || true
}

function regradlew()
{
	:
	#mv settings.gradle.ORIGINAL settings.gradle || true
	#mv ../settings.gradle.ORIGINAL ../settings.gradle || true
}

function gradlew_baseline()
{
	degradlew
	${LIFERAY_PORTAL_DIR}/gradlew baseline -a -q
	regradlew
}

function gradlew_clean()
{
	degradlew
	${LIFERAY_PORTAL_DIR}/gradlew clean
	regradlew
}

function gradlew_deploy()
{
	degradlew
	figlet -f eftipiti -w 280 ${LIFERAY_PORTAL_DIR}/gradlew deploy -a -q || true
	${LIFERAY_PORTAL_DIR}/gradlew deploy -a -q
	regradlew
}

function gradlew_eclipse()
{
	degradlew
	${LIFERAY_PORTAL_DIR}/gradlew eclipse -a -q
	regradlew
}

function gradlew_format()
{
	degradlew
	${LIFERAY_PORTAL_DIR}/gradlew formatSource -a -q
	regradlew
}
