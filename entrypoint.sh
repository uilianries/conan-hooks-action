#!/bin/bash

echo "Setting up Conan hooks..."
set +x

echo "Installing dependencies..."
pip install pylint astroid

echo "Installing hooks..."
conan config install https://github.com/conan-io/hooks.git
conan config set hooks.conan-center
conan config set hooks.recipe_linter

echo "Running Conan create..."
conan create . conan/testing
