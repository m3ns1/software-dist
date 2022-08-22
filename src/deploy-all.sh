#!/bin/bash

mapfile -t components <../components

cwd=$(pwd)
base=${cwd}/..
target=${cwd}/../target

deploy() {
for module in "${components[@]}"
do
  filename=`ls ${target} | grep $module`
  echo "$module -> $filename"
  len=`echo ${filename} | wc -c`
  offset=$((len - 3))
  if [[ "${filename:offset}" == "gz" ]]; then
    echo tar: deploy.sh ${filename}
    ./deploy.sh ${filename}
  elif [[ "${filename:((len - 4))}" == "deb" ]]; then
    echo deb: deploy.sh "${filename}"
    ./deploy.sh "${filename}"
  fi
done
}

deploy
