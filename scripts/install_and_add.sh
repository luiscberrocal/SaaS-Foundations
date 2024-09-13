#!/bin/bash

# Check if a package name was supplied
if [ -z "$1" ]
then
    echo "No package name supplied"
    exit 1
fi

# Check if a requirements file was supplied, if not use requirements.txt
if [ -z "$2" ]
then
    REQUIREMENTS_FILE="requirements.txt"
else
    REQUIREMENTS_FILE=$2
fi

# Install the package
pip install $1

# Get the installed package version
PACKAGE_VERSION=$(pip freeze | grep $1)

# Append the package and its version to the requirements file
echo $PACKAGE_VERSION >> $REQUIREMENTS_FILE