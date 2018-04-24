# Golang Container Build

This project is a proof of concept for building Go (golang) apps within Docker containers targeted at the host machine.
I have been frustrated with having to deal with GOHOME configurations and other nuances of working with Go.
This has proven to be a trivial solution for simple projects.

## Running

You can build the example app with make.
The code currently assumes you are wanting to build for Mac OS.

```
make build
```

And then you can run the app directly.

```
./bin/app
```
