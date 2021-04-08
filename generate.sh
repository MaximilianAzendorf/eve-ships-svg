#!/bin/bash

pushd eve-ships
	./generate.py
popd
rm -rf docs/svg
cp -r eve-ships/output/full docs/svg
rm -rf eve-ships/output