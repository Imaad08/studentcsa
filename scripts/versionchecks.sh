#!/bin/bash

# Show the active Ruby version, it needs to be 3 or higher
ruby -v
# Bundler version, it is part of Ruby install
bundle -v

# Show active Python version, it needs to be 3.10 or better
python --version

# Show Jupyter packages, nbconvert needs to be in the list of installed
jupyter --version

git config --global --list