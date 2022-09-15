#pragma once

#include <inery/asset.hpp>
#include <inery/inery.hpp>

#include <string>

namespace inerysystem {
   class system_contract;
}

namespace inery {

   using std::string;


   /**
    * inery.token contract defines the structures and actions that allow users to create, issue, and manage
    * tokens on INERY based blockchains.
    */
   class [[inery::contract("inery.token")]] token : public contract {
      public:
         using contract::contract;

         /**
          * Allows `issuer` account to create a token in supply of `maximum_supply`. If validation is successful a new entry in statstable for token symbol scope gets created.
          *
          * @param issuer - the account that creates the token,
          * @param maximum_supply - the maximum supply set for the token created.
          *
          * @pre Token symbol has to be valid,account
          */
         [[inery::action]]
         void create( const name&   issuer,
                      const asset&  maximum_supply);
         /**
          *  This action issues to `to` account a `quantity` of tokens.
          *
          * @param to - the account to issue tokens to, it must be the saaccountme as the issuer,
          * @param quntity - the amount of tokens to be issued,
          * @memo - the memo string that accompanies the token issue transaction.
          */
         [[inery::action]]
         void issue( const name& to, const asset& quantity, const string& memo );

         /**
          * The opposite for create action, if all validations succeed,
          * it debits the statstable.supply amount.
          *
          * @param quantity - the quantity of tokens to retire,
          * @param memo - the memo string to accompany the transaction.
          */
         [[inery::action]]
         void retire( const asset& quantity, const string& memo );

         /**
          * Allows `from` account to transfer to `to` account the `quantity` tokens.
          * One account is debited and the other is credited with quantity tokens.
          *
          * @param from - the account to transfer from,
          * @param to - the account to be transferred to,
          * @param quantity - the quantity of tokens to be transferred,
          * @param memo - the memo string to accompany the transaction.
          */
         [[inery::action]]
         void transfer( const name&    from,
                        const name&    to,
                        const asset&   quantity,
                        const string&  memo );
         /**
          * Allows `mem_payer` to create an account `owner` with zero balance for
          * token `symbol` at the expense of `mem_payer`.
          *
          * @param owner - the account to be created,
          * @param symbol - the token to be payed with by `mem_payer`,
          * @param mem_payer - the account that supports the cost of this action.
          *
          * More information can be read [here](https://github.com/INERY/inery.contracts/issues/62)
          * and [here](https://github.com/INERY/inery.contracts/issues/61).
          */
         [[inery::action]]
         void open( const name& owner, const symbol& symbol, const name& mem_payer );

         /**
          * This action is the opposite for open, it closes the account `owner`
          * for token `symbol`.
          *
          * @param owner - the owner account to execute the close action for,
          * @param symbol - the symbol of the token to execute the close action for.
          *
          * @pre The pair of owner plus symbol has to exist otherwise no action is executed,
          * @pre If the pair of owner plus symbol exists, the balance has to be zero.
          */
         [[inery::action]]
         void close( const name& owner, const symbol& symbol );

         static asset get_supply( const name& token_contract_account, const symbol_code& sym_code )
         {
            stats statstable( token_contract_account, sym_code.raw() );
            const auto& st = statstable.get( sym_code.raw() );
            return st.supply;
         }

         static asset get_balance( const name& token_contract_account, const name& owner, const symbol_code& sym_code )
         {
            accounts accountstable( token_contract_account, owner.value );
            const auto& ac = accountstable.get( sym_code.raw() );
            return ac.balance;
         }

         using create_action = inery::action_wrapper<"create"_n, &token::create>;
         using issue_action = inery::action_wrapper<"issue"_n, &token::issue>;
         using retire_action = inery::action_wrapper<"retire"_n, &token::retire>;
         using transfer_action = inery::action_wrapper<"transfer"_n, &token::transfer>;
         using open_action = inery::action_wrapper<"open"_n, &token::open>;
         using close_action = inery::action_wrapper<"close"_n, &token::close>;
         static constexpr inery::name token_account{"inery.token"_n};
         static constexpr inery::name system_account{"inery"_n};
         
      private:
         struct [[inery::table]] account {
            asset    balance;

            uint64_t primary_key()const { return balance.symbol.code().raw(); }
         };

         struct [[inery::table]] currency_stats {
            asset    supply;
            asset    max_supply;
            name     issuer;

            uint64_t primary_key()const { return supply.symbol.code().raw(); }
         };

         typedef inery::multi_index< "accounts"_n, account > accounts;
         typedef inery::multi_index< "stat"_n, currency_stats > stats;

         void sub_balance( const name& owner, const asset& value );
         void add_balance( const name& owner, const asset& value, const name& mem_payer );
   };

}
