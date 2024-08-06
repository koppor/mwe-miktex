# Minimal Working Examples for MiKTeX on a CI

This repository demonstrates using MiKTeX in a CI (Windows, Linux) and inside Docker.

The original idea was to illustrate issues with MiKTeX on Linux.
They are all solved now and the project evolved to a playground for general MiKTeX usage on a CI.

## MiKTeX docker image

A custom MiKTeX docker image was build, because of [mitkex#1370](https://github.com/MiKTeX/miktex/issues/1370).
In October 2023, there was an update to the [MiKTeX Docker image](https://github.com/MiKTeX/docker-miktex/tree/master) with following run recommendation:

    docker run -ti -v miktex:/var/lib/miktex -v `pwd`:/miktex/work -e MIKTEX_UID=`id -u` miktex/miktex:essential pdflatex sample2e.tex

The main difference is that the mwe-miktex `Dockerfile`

- additionally installs `cm-super`
- Exectues following commands
  - `RUN miktex --verbose fontmaps configure`
  - `RUN miktex --verbose fndb refresh`
  - `RUN initexmf --admin --verbose --update-fndb`

The MiKTeX docker image is available via <https://hub.docker.com/u/miktex> (source: <https://github.com/MiKTeX/docker-miktex>).

## Development hints

Run MiKTeX on Linux with [act](https://github.com/nektos/act):

    act --platform ubuntu-22.04=fwilhe2/act-runner:latest -W .github/workflows/miktex-linux.yml
