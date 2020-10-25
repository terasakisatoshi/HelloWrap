
#include <string>

#include "jlcxx/jlcxx.hpp"

std::string greet()
{
   return "hello, world";
}

std::vector<int> get_array(int N){
    std::vector<int> v;
    for(int i = 0; i < N; i++){
        v.push_back(i);
    }
    return v;
}

JLCXX_MODULE define_julia_module(jlcxx::Module& mod)
{
  mod.method("greet", &greet);
  mod.method("get_array", &get_array);
}