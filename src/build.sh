#!/bin/bash
#set -x

cwd=$(pwd)
base=${cwd}/..
target=${cwd}/../target

module=$1
filename=`ls "${target}" | grep ${module}`
exists=`echo $filename | wc -l`
if [[ "${exists}" == "1" ]]; then
  echo Archiviert ${filename}
  mv "${target}/${filename}" ${target}/_archive/
fi

len=`echo ${module} | wc -c`

if test -f "${base}/$module/install.sh"; then
  echo "Modul «${module}» wird gebaut."
  tar -cvzf ${target}/${module}.tar.gz ${base}/$module
else
  echo dpkg-deb --build --root-owner-group -v --debug ${base}/$module ${target}
  dpkg-deb --build --root-owner-group -v --debug ${base}/$module ${target}
fi
