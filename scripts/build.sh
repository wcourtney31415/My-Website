#!/usr/bin/env bash
rm -rf build;
mkdir -p build 
elm make src/Main.elm --output=build/app.js 
cp -r assets/* build/