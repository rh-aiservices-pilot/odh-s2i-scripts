#!/usr/bin/env bash

pushd "$(pwd)" || exit

echo 'Installing odh client'
ODH_DIR="$HOME/.local/bin"

mkdir -p ${ODH_DIR} 
wget -O "${ODH_DIR}/odh" https://raw.githubusercontent.com/cfchase/odh-s2i-scripts/master/odh.sh &> /dev/null
chmod a+x "${ODH_DIR}/odh" &> /dev/null

echo 'Installing cookiecutter package'
pip install cookiecutter &> /dev/null

echo 'Installing GitHub client'
mkdir -p "/tmp/odh-client"
cd "/tmp/odh-client" || exit
wget https://github.com/cli/cli/releases/download/v1.7.0/gh_1.7.0_linux_386.tar.gz &> /dev/null
tar -xvf gh_1.7.0_linux_386.tar.gz &> /dev/null
mv gh_1.7.0_linux_386/bin/gh ${ODH_DIR} &> /dev/null

echo 'Cleaning up'
rm -rf /tmp/odh-client

popd || exit