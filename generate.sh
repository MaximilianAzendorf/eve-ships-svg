#!/bin/bash

pushd eve-ships
	./generate.py
popd
cp -r eve-ships/output/full svg
rm -rf eve-ships/output