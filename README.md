# Golang Container Build

This project is a proof of concept for building Go (golang) apps within Docker containers targeted at the host machine.
I have been frustrated with having to deal with GOHOME configurations and other nuances of working with Go.
This has proven to be a trivial solution for simple projects.

## Running

The default parameters will build the example app for 64-bit mac OS (darwin/amd64).

```
./build
```

And then you can run the app directly.

```
./bin/app
```

## Other OS's and Architectures

You can build for other operating systems and architectures with the appropriate flags.

```
./build --os linux --arch arm64
```

### Windows

Windows builds are completely untested.
I notice the script doesn't output a .exe extension so that could probably use a PR.
