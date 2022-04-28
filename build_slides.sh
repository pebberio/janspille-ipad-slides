#!/bin/bash
SLIDES=`ls -d slides/*/`
for SLIDE in $SLIDES; do 
    if [ -d "${SLIDE}media" ]
    then
        rm ${SLIDE}index.html;
        SECTIONS=`ls ${SLIDE}media/ | sed -e 's|.*|<section><img src="media/&" border="0" /></section>|g'` \
            && SECTIONS=`echo $SECTIONS | tr '\n' "\\n"` \
            && sed -e 's|###SECTIONS###|'"${SECTIONS}"'|g' slides/template.html >> ${SLIDE}index.html
    fi
done


