#!/bin.bash
export XRFBSESSIONID=libre5902
export XRFBSESSIONSDIR=~/xrfb-sessions/
export XRFBSESSIONDIR=${XRFBSESSIONSDIR}/${XRFBSESSIONID}
rm -rf  ${XRFBSESSIONDIR}
mkdir -p  ${XRFBSESSIONDIR}
echo -n 'XRFBPASSWD=' > ${XRFBSESSIONDIR}/environment
echo 'tea41dragon' >> ${XRFBSESSIONDIR}/environment
if [ $# -eq 1 ]
then
echo -n 'XRFBURI=' >> ${XRFBSESSIONDIR}/environment
echo $1 >> ${XRFBSESSIONDIR}/environment
else
echo -n 'XRFBURI=' >> ${XRFBSESSIONDIR}/environment
echo "" >> ${XRFBSESSIONDIR}/environment
fi
export XRFBHOSTPORT=5902
docker run -p ${XRFBHOSTPORT}:5900 -e XRFBRESX=1000 -e XRFBRESY=1000 -e XRFBDEPTH=24 --env-file ${XRFBSESSIONDIR}/environment \
    --cidfile=${XRFBSESSIONDIR}/containerid  --label=net.opencobalt.xrfb.session=${XRFBSESSIONID} \
    -v $HOME/unsafe:/data \
    jdougan/base-xrfb-libreoffice:1
