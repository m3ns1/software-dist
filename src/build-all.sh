#!/bin/bash

mapfile -t components <../components

cwd=$(pwd)
base=${cwd}/..
target=${cwd}/../target


build_debs() {
mv ${target}/*.deb ${target}/_archive
for d in "${components[@]}"
do
  if test -f "${base}/$d/DEBIAN/control"; then
    name=${d:3}
    echo "${name} wird jetzt gebaut"
    #./build.sh "${name}"
  fi
done
}

build_tar() {
mv ${target}/*.tar.gz ${target}/_archive
for d in "${components[@]}"
do
  if test -f "${base}/$d/install.sh"; then
    name=${d:3}
    echo "${name} wird jetzt gebaut"
    #./build.sh "${name}"
  fi
done
}

build_debs
build_tar
