# Antenna Models

Just some antenna modeling stuff

## Starting a PyNEC/JupyterLab Docker container

The included `Dockerfile` can be used to create a Docker image that
includes `PyNEC` Python module. When run, the container starts a JupyterLab server.

The following can be used to build the image and start a container with
the `./notebooks` subdirectory as a mounted volume:

``` shell
docker build -t USERNAME/jupyterlab-pynec .
docker run -p 8888:8888 -v $(pwd)/notebooks:/app/notebooks USERNAME/jupyterlab-pynec
```
