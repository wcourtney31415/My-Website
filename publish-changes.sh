#!/usr/bin/env bash
bash build.sh
rm -rf gh-pages/*
cp -r target/* gh-pages
cd gh-pages
git add .
git commit -m "Latest changes."
git push
