#!/usr/bin/env bash

mkdir -p target
elm make src/Main.elm --output=target/app.js
cp -r assets/* target/
