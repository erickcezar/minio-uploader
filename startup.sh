#!/bin/bash


export S3_URL="http://localhost:9000"
export S3_ACCESS_KEY="AKIAIOSFODNN7"
export S3_SECRET_KEY="wJalrXUtnFEMI/K7MDENG/bPxRfiCY"

gunicorn3 --bind 0.0.0.0:5000 wsgi:app > gunicorn.log &
