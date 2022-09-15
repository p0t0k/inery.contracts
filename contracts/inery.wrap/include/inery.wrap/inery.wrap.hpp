#pragma once

#include <inery/inery.hpp>
#include <inery/ignore.hpp>
#include <inery/transaction.hpp>

namespace inery {
   /**
    * @defgroup inerywrap inery.wrap
    * @ingroup inerycontracts
    * inery.wrap contract simplifies Block Producer superuser actions by making them more readable and easier to audit.

    * It does not grant block producers any additional powers that do not already exist within the
    * system. Block producers can already change an account's keys or modify an
    * account's contract at the request of ECAF or an account's owner. However, the current method
    * is opaque and leaves undesirable side effects on specific system accounts.
    * inery.wrap allows for a cleaner method of implementing these important governance actions.
    * @{
    */
   class [[inery::contract("inery.wrap")]] wrap : public contract {
      public:
         using contract::contract;

         /**
          * Execute action.
          *
          * Execute a transaction while bypassing regular authorization checks.
          *
          * @param executer - account executing the transaction,
          * @param trx - the transaction to be executed.
          *
          * @pre Requires authorization of inery.wrap which needs to be a privileged account.
          *
          * @post Deferred transaction MEM usage is billed to 'executer'
          */
         [[inery::action]]
         void exec( ignore<name> executer, ignore<transaction> trx );

         using exec_action = inery::action_wrapper<"exec"_n, &wrap::exec>;
   };
   /** @}*/ // end of @defgroup inerywrap inery.wrap
} /// namespace inery
