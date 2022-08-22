#!/bin/bash

cwd=$(pwd)
base=${cwd}/..
target=${cwd}/../target

module=$1
filename=`ls ${target} | grep $module`
len=`echo ${filename} | wc -c`
offset=$((len - 3))

exists=`echo $filename | wc -l`
if [[ "${exists}" == "0" ]]; then
  echo $module existiert nicht.
  exit
fi

echo "Deploying: $module ($filename)"
if [[ "${filename:offset}" == "gz" ]]; then
  tar -xvf "${target}/$filename" -C /tmp
  name=${filename:0:-7}
  cd /tmp/$name || exit -1
  ./install.sh
elif [[ "${filename:((len - 4))}" == "deb" ]]; then
  sudo dpkg -i "${target}/${filename}"
  sudo apt -y -f install
fi

