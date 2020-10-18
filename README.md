# HelloWrap
Call C++ Hello World via CxxWrap

# Usage

- Install Docker
- Install Julia
- Install BinaryBuilder.jl via

```console
$ julia -e 'using Pkg; Pkg.add("BinaryBuilder")'
```

- run the following command:

`$ julia build_tarball.jl`

# Call shared library

```console
$ cd product
$ tar xvfz libhello.v0.1.0.x86_64-apple-darwin14-cxx11.tar.gz
$ cd ..
$ julia callcxx.jl
```