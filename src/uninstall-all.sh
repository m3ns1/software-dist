#!/bin/bash

mapfile -t components <../components

cwd=$(pwd)
base=${cwd}/..
target=${cwd}/../target

uninstall() {
for module in "${components[@]}"
do
  filename=`ls ${target} | grep $module`
  len=`echo ${filename} | wc -c`
  offset=$((len - 3))
  if [[ "${filename:offset}" == "gz" ]]; then
    #./deploy.sh "${filename}"
    echo tar: uninstall.sh ${filename:2}
    ./uninstall.sh ${filename:2}
  elif [[ "${filename:((len - 4))}" == "deb" ]]; then
    echo deb: uninstall.sh "${filename:2}"
    ./uninstall.sh "${filename:2}"
  fi
done
}

uninstall
