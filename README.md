# Minimal Working Examples for MiKTeX on a CI

This repository demonstrates using MiKTeX in a CI.
The original idea was to illustrate issues with MiKTeX on Linux.
The project evolved to a playground for general MiKTeX usage on a CI.

## Development hints

Run MiKTeX on Linux with [act](https://github.com/nektos/act):

    act --platform ubuntu-22.04=fwilhe2/act-runner:latest -W .github/workflows/miktex-linux.yml
