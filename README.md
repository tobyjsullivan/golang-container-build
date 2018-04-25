# Golang Container Build

This project is a proof of concept for building Go (golang) apps within Docker containers targeted at the host machine.
I have been frustrated with having to deal with GOHOME configurations and other nuances of working with Go.
This has proven to be a trivial solution for simple projects.

You can see all supported options in the help.

```
./build --help
```

## Running

The default parameters will build the example app for 64-bit mac OS (darwin/amd64).

```
./build
```

And then you can run the app directly.

```
./bin/app
```

### Specifying a source directory

The default source directory (`./src`) is intended for using this script within your project repo.
You can specify any alternative go project with the `--src` argument.

```
./build --src ~/go/src/github.com/tools/godep/
```

### Other OS's and Architectures

You can build for other operating systems and architectures with the appropriate flags.

```
./build --os linux --arch arm64
```

#### Windows

Windows builds are completely untested.
I notice the script doesn't output a .exe extension so that could probably use a PR.
