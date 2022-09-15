#include <inery.system/native.hpp>

#include <inery/check.hpp>

namespace inerysystem {

   void native::onerror( ignore<uint128_t>, ignore<std::vector<char>> ) {
      inery::check( false, "the onerror action cannot be called directly" );
   }

}
