# chess

[![Ada (GNAT)](https://github.com/AdmaJonse/chess/actions/workflows/ada.yml/badge.svg?branch=main)](https://github.com/AdmaJonse/chess/actions/workflows/ada.yml)

A chess implementation written in Ada. 

This project is a work in progress. Basic piece movement is functional but limited. There is still no way to actually win the game.


## Build

A Makefile is provided to build, test and generate documentation for this project. To build the project, run the following:

```
> make
```

## Test

Unit tests are defined for all methods in this project. To execute unit tests, run the following:

```
> make test
```

## Documentation

This project is written using gnatdoc comments, so that documentation can automatically be generated. To generate documentation, run the following:

```
> make docs
```

## Workflow

A GitHub workflow been created to provide continuous integration for this project. The workflow will create a Ubuntu docker container with gnat dependencies installed and attempt to build the project. It will then build and execute all unit tests.

The workflow can be tested locally using [act](https://github.com/nektos/act). Once act is installed, the workflow can be executed using the following command:

```
> act -s GITHUB_TOKEN=$(cat .token)
```

where `.token` is a private file containing the user's GitHub access token. This file provides access to the user's GitHub account and must not be shared.
