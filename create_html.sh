#! /usr/bin/zsh -eu
OUTPUTDIR=`pwd`/build

mkdir -p ${OUTPUTDIR}
for slide in $( ls )
do
    if [ -d ${slide} ] && [ ${slide} != 'build' ]
    then
        rst2s5 --theme=small-black `pwd`/${slide}/source/index.rst ${OUTPUTDIR}/${slide}.html
    fi
done
