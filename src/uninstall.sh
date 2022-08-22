#!/bin/bash


cwd=$(pwd)
base=${cwd}/..
target=${cwd}/../target

module=$1
filename=`ls "${target}" | grep ${module}`
len=`echo ${filename} | wc -c`
offset=$((len - 3))

if [[ "${filename:offset}" == "gz" ]]; then
  tar -xvf "${target}/$filename" -C /tmp
  name=${filename:0:-7}
  cd /tmp/$name || exit -1
  echo Deinstalliert ${name}
  ./uninstall.sh
  rm -r /tmp/${name}
elif [[ "${filename:((len-4))}" == "deb" ]]; then
  name=`dpkg --info ${target}/${filename}  | grep -E -o "Package: (.*)" | cut -d':' -f2`
  name="${name:1}"
  echo Deinstalliert ${name}
  sudo apt-get -y purge ${name}
  sudo apt-get -y autoremove
fi

