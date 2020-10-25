using Pkg
Pkg.activate(".")
pkg"dev ~/.julia/dev/libhello_jll"

# Load the module and generate the functions
module CppHello
  using CxxWrap
  using libhello_jll
　const libname = libhello_jll.libhello_path

  @wrapmodule(libname)

  function __init__()
    @initcxx
  end
end

# Call greet and show the result
@show CppHello.greet()
@show CppHello.get_array(10)
pkg"rm libhello_jll"