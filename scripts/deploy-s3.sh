#!/usr/bin/env bash

aws s3 sync ./_site s3://mandos.net.pl --delete
