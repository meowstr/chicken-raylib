#/bin/sh

######################################################################
# Use this to install raylib 6.2 as a shared library on your system. #
######################################################################

# Make each command visible before it runs
set -x

# Setup a workspace
mkdir raylib-install
cd raylib-install

# Download source
curl -L -o src.tar.gz "https://github.com/raysan5/raylib/archive/refs/tags/6.2.tar.gz" 

# Untarball
tar -xvf src.tar.gz

# Setup a build
cd "raylib-6.2"
mkdir build
cd build

# Configure
cmake .. -DBUILD_EXAMPLES=OFF -DBUILD_SHARED_LIBS=ON

# Build
cmake --build .

# Install (root perms likely required)
sudo cmake --install .

