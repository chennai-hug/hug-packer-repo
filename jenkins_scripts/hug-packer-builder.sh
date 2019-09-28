#!/bin/bash

INSTALLED_VERSION=`packer --version`

echo ${INSTALLED_VERSION}
if [ ${INSTALLED_VERSION} != ${PACKER_VERSION} ]; then
echo Installing Packer
curl -sSLf -o /tmp/packer.zip https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_${PACKER_PLATFORM}_amd64.zip
unzip -q -o /tmp/packer.zip -d /usr/local/bin
chmod +x /usr/local/bin/packer
packer version
fi
export AWS_SECRET_ACCESS_KEY=${AWS_ACCESS_KEY_ID}
export AWS_ACCESS_KEY_ID=${AWS_SECRET_ACCESS_KEY}
export PACKER_AMI_VERSION=${PACKER_AMI_VERSION}
packer build -debug hug-packer-single-aws-builder.json
