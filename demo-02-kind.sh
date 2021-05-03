#! /bin/bash

cd $(dirname $0)

set -x

clear
kind create cluster
