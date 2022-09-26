#!/usr/bin/env bash
rm -rf target;
mkdir -p target 
elm make src/Main.elm --output=target/app.js 
cp -r assets/* target/