#!/bin/sh -l

sh -c "echo Hello Docs"

sh -c "npm i"

sh -c "antora local-site.yml"

sh -c "chmod a+xrw build/site"
