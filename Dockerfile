# Use the official Ubuntu base image
FROM ubuntu:24.04

# Prevent interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Install system dependencies
RUN apt update && apt install -y \
    python3 \
    python3-dev \
    python3-jupyterlab-server \
    python3-matplotlib \
    python3-numpy \
    python3-pip \
    python3-venv \
    swig \
    build-essential \
    cmake \
    git \
    gfortran \
    libtool

# Set the working directory
WORKDIR /app

# Clone the python-necpp repository
RUN git clone --recursive https://github.com/tmolteno/python-necpp.git

# Install the python-necpp package
WORKDIR /app/python-necpp/PyNEC

# Build the python-necpp package
RUN ./build.sh

# Install the python-necpp package
RUN python3 setup.py install

# Reset the working directory
WORKDIR /app

# Create a vitural environment, with access to system site packages
RUN python3 -m venv venv --system-site-packages

# Install the JupyterLab package in the virtual environment
RUN venv/bin/python -m pip install jupyterlab

# Set the command to start JupyterLab
CMD ["./venv/bin/python", "-m", "jupyterlab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]
