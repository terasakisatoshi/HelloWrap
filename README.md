# LibHelloBuilder.jl

Call C++ Hello World shared lib via CxxWrap.jl/BinaryBuilder.jl

# Usage

- Install Docker
- Install Julia
- Install BinaryBuilder.jl via

```console
$ julia -e 'using Pkg; Pkg.add("BinaryBuilder")'
```

- run the following command:

```console
$ export BINARYBUILDER_AUTOMATIC_APPLE=true
$ julia --project=@. -e 'using Pkg; Pkg.instantiate()'
$ julia --project=@. build_tarball.jl --verbose --deploy=local
```

## Optional

- If you have a GitHub account named `your_GitHub_account`, you can set `--deploy=<your_GitHub_account>/libhello_jll.jl`. It will a repository `<your_GitHub_account>/libhello_jll.jl` automatically for you.

You can also upload shared library via:

```julia
julia> cd("/path/to/this/repository")
julia> using BinaryBuilder
julia> BinaryBuilder.upload_to_github_releases("<your_GitHub_account>/libhello_jll.jl","libhello-v0.1.0+0", joinpath(pwd(), "products"))
```

# Call shared library locally

```console
$ julia --project=@. callcxx.jl
```

or

```console
$ tar xfv products/libhello.v0.1.0.x86_64-apple-darwin14-cxx11.tar.gz -C ./products
$ julia --project=@. -q
julia> module CppHello
  using CxxWrap
　const libname = joinpath("products","lib","libhello")
  @wrapmodule(libname)

  function __init__()
    @initcxx
  end
end

julia> @show CppHello.greet()
```


# References

- [Pkg + BinaryBuilder -- The Next Generation](https://julialang.org/blog/2019/11/artifacts/)
- [BinaryBuilder.jl](https://github.com/JuliaPackaging/BinaryBuilder.jl)
- [Yggdrasil.jl](https://github.com/JuliaPackaging/Yggdrasil)
  - Especially [Yggdrasil/H/](https://github.com/JuliaPackaging/Yggdrasil/tree/master/H)
- [barche/cxxwrap-juliacon2020](https://github.com/barche/cxxwrap-juliacon2020)
- [barche/libfoo](https://github.com/barche/libfoo)

# Apendix

- [HelloCExecutableBuilder.jl](https://github.com/terasakisatoshi/HelloCExecutableBuilder.jl)  
 
