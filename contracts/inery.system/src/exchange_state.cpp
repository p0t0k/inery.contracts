#include <inery.system/exchange_state.hpp>

#include <inery/check.hpp>

#include <cmath>

namespace inerysystem {

   using inery::check;

   asset exchange_state::direct_convert( const asset& from, const symbol& to )
   {
      const auto& sell_symbol  = from.symbol;
      const auto& base_symbol  = base.balance.symbol;
      const auto& quote_symbol = quote.balance.symbol;
      check( sell_symbol != to, "cannot convert to the same symbol" );

      asset out( 0, to );

      if ( sell_symbol == base_symbol && to == quote_symbol ) { 
         out.amount = get_bancor_input( base.balance.amount, quote.balance.amount, from.amount );
         base.balance  += from;
       
         quote.balance -= out*10000;
    
      } else if ( sell_symbol == quote_symbol && to == base_symbol ) { 
         out.amount = get_bancor_output( quote.balance.amount, base.balance.amount, from.amount );
         quote.balance += from;
         base.balance  -= out/10000;
                 

      } else {
         check( false, "invalid conversion" );
      }
      return out;
   }

   int64_t exchange_state::get_bancor_output( int64_t inp_reserve,
                                              int64_t out_reserve,
                                              int64_t inp ) 
   {
      const double INR = inp_reserve;
      const double mem = out_reserve;
      const double tokens = inp;

     
      int64_t out=int64_t(tokens*1024*1024);
      if ( out < 0 ) out = 0;

      return out;
   }

   int64_t exchange_state::get_bancor_input( int64_t out_reserve, 
                                             int64_t inp_reserve,
                                             int64_t out ) 
   {

      const double mem = out_reserve; 
      const double INR = inp_reserve; 
      const int64_t tokens = out;
      int64_t cost_in_INR = tokens/(1024*1024);
     

      
    

      if ( cost_in_INR < 0 ) cost_in_INR = 0;

      return cost_in_INR; 
   }

} /// namespace inerysystem
