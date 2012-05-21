#! /bin/zsh -eu
SOURCEDIR=source
OUTPUTDIR=build/build


mkdir -p ${OUTPUTDIR}
for SOURCE in $( ls source )
do
    if [ -f ${SOURCEDIR}/${SOURCE} ]
    then
        BODY=$( echo ${SOURCE} | sed -e 's/\.[^.]*$//g' )
        case ${SOURCE} in
            *\.rst)
                rst2s5 --theme=small-black ${SOURCEDIR}/${SOURCE} ${OUTPUTDIR}/${BODY}.html
                ;;
            *\.md)
                markdown2impress.pl  --outputdir="$( pwd )/${OUTPUTDIR}" ${SOURCEDIR}/${SOURCE}
                mv ${OUTPUTDIR}/index.html ${OUTPUTDIR}/${BODY}.html
                ;;
            *)
                ;;
        esac
    fi
done
