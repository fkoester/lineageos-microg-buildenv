#! /bin/sh

DEVICES=FP2
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

docker run \
    --name=lineage-$(date +%Y%m%d_%H%M) \
    --rm \
    -it \
    -e "USER_NAME=Foo" \
    -e "USER_MAIL=foo@example.com" \
    -e "WITH_SU=false" \
    -e "RELEASE_TYPE=microG" \
    -e "DEVICE_LIST=$DEVICES" \
    -e "BRANCH_NAME=cm-14.1" \
    -e "OTA_URL=https://api.lineage.microg.org" \
    -e "CRONTAB_TIME=now" \
    -e "SIGNATURE_SPOOFING=restricted" \
    -e "CUSTOM_PACKAGES=GmsCore GsfProxy FakeStore FDroid FDroidPrivilegedExtension MozillaNlpBackend NominatimNlpBackend com.google.android.maps.jar" \
    -e "SIGN_BUILDS=false" \
    -e "CLEAN_OUTDIR=false" \
    -e "CLEAN_AFTER_BUILD=true" \
    -e "ZIP_SUBDIR=true" \
    -e "LOGS_SUBDIR=true" \
    -e "DELETE_OLD_ZIPS=3" \
    -e "DELETE_OLD_LOGS=3" \
    -v "${DIR}/work/cache:/srv/ccache" \
    -v "${DIR}/work/lineage:/srv/src" \
    -v "${DIR}/work/zips:/srv/zips" \
    -v "${DIR}/work/logs:/srv/logs" \
    -v "${DIR}/local_manifests:/srv/local_manifests" \
    -v "${DIR}/scripts:/srv/userscripts" \
    lineageos4microg/docker-lineage-cicd
