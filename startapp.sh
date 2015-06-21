#!/bin.bash
export XRFBSESSIONID=testsession
export XRFBSESSIONSDIR=~/xrfb-sessions/
export XRFBSESSIONDIR=${XRFBSESSIONSDIR}/${XRFBSESSIONID}
rm -rf  ${XRFBSESSIONDIR}
mkdir -p  ${XRFBSESSIONDIR}
echo -n 'XRFBPASSWD=' > ${XRFBSESSIONDIR}/xrfbpasswd
echo 'tea41dragon' >> ${XRFBSESSIONDIR}/xrfbpasswd
if [ $# -eq 1 ]
then
echo -n 'XRFBURI=' > ${XRFBSESSIONDIR}/xrfbpasswd
echo $1 >> ${XRFBSESSIONDIR}/xrfbpasswd
fi
export XRFBHOSTPORT=5901
docker run -p ${XRFBHOSTPORT}:5900 -e XRFBRESX=1000 -e XRFBRESY=1000 -e XRFBDEPTH=24 --env-file ${XRFBSESSIONDIR}/xrfbpasswd \
    --cidfile=${XRFBSESSIONDIR}/containerid  --label=net.opencobalt.xrfb.session=${XRFBSESSIONID} \
    jdougan/base-xrfb-libreoffice:1
