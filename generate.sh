#!/bin/bash

pushd eve-ships
	./generate.py
popd
rm -rf docs/svg
cp -r eve-ships/output/full docs/svg
rm -rf eve-ships/output
pushd docs
	zip -r all.zip svg/
	pushd svg
		echo "var svgs = [" > ../shiplist.js
		ls -c1 | sort | sed -e "s/^/\"/" | sed -e "s/\$/\",/" >> ../shiplist.js
		echo "]" >> ../shiplist.js
	popd
popd