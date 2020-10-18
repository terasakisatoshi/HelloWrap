# Load the module and generate the functions
module CppHello
  using CxxWrap
  @wrapmodule(joinpath("./products","lib","libhello"))

  function __init__()
    @initcxx
  end
end

# Call greet and show the result
@show CppHello.greet()
