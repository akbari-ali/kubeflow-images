#!/bin/sh
docker run quay.io/volvocars/papermill:latest s3://volvodata/notebooks/test.ipynb s3://volvodata/notebooks/test-out.ipynb s3://volvodata/notebooks/parameters/test-params.yaml