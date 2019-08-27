#!/bin/bash

if [ "$#" -ne 3 ]; then
    echo "Usage: ./deploy.sh  input_notebook output_notebook paramsfile"
    exit
fi

IN_NB_S3=$1
OUT_NB_S3=$2
PARAMS_S3=$3

export LC_ALL=C.UTF-8
export LANG=C.UTF-8

mkdir working
cd working
aws s3 cp $IN_NB_S3 input.ipynb
aws s3 cp $PARAMS_S3 params.yaml
papermill input.ipynb output.ipynb -f params.yaml --log-output
aws s3 cp output.ipynb $OUT_NB_S3
cd ..
rm -rf working