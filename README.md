# Antenna Models

Just some antenna modeling stuff

## Starting a PyNEC/JupyterLab Docker container

The included `Dockerfile` can be used to start a container that builds
the `PyNEC` Python module and runs JupyterLab.

The following can be used to build and run the container:

``` shell
docker build -t USERNAME/jupyterlab-pynec .
docker run -p 8888:8888 -v $(pwd)/notebooks:/app/notebooks USERNAME/jupyterlab-pynec
```
