#!/bin/bash

pushd eve-ships
	git reset --hard
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

pushd eve-ships
	sed -ie "s/0, 0, 0/90, 0, 0/" generate.py
	./generate.py
popd
cp -r eve-ships/output/full docs/svg/top
rm -rf eve-ships/output

pushd docs
	zip -r all_top.zip svg/top/
popd

pushd eve-ships
	git reset --hard
popd