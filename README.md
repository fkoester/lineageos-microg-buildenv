# lineageos-microg-buildenv

This is a Docker based environment for building [LineageOS for microG](https://lineage.microg.org/).
In addition to their builds this build also includes the open source app [Yalp Store](https://github.com/yeriomin/YalpStore/)
as a system app for conveniently installing and updating apps from the Google Play Store.

The build uses the unmodified [docker image from the LineageOS for microG project](https://github.com/lineageos4microg/docker-lineage-cicd).

In addition, we add the Yalp Store APK via this repository: https://github.com/fkoester/lineage_microg_yalp_prebuiltapk

This project is focused primarily on the Fairphone 2, but you can change the `DEVICES` variable in `run.sh` to built for other targets.
You then probably also need to modify the list of proprietary repositories in `local_manifests/vendor.xml`.

**Note**: You need around 80 GiB free space in the `work/` directory.

Usage:

* Start docker
* Execute `./run.sh`
* When build succeeded, you can find an installable zip in `work/zips/`.
