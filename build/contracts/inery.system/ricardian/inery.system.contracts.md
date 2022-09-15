<h1 class="contract">activate</h1>

---
spec_version: "0.2.0"
title: Activate Protocol Feature
summary: 'Activate protocol feature {{nowrap feature_digest}}'
icon: http://127.0.0.1/ricardian_assets/inery.contracts/icons/admin.png#9bf1cec664863bd6aaac0f814b235f8799fb02c850e9aa5da34e8a004bd6518e
---

{{$action.account}} activates the protocol feature with a digest of {{feature_digest}}.



<h1 class="contract">buymem</h1>

---
spec_version: "0.2.0"
title: Buy MEM
summary: '{{nowrap payer}} buys MEM on behalf of {{nowrap receiver}} by paying {{nowrap quant}}'
icon: http://127.0.0.1/ricardian_assets/inery.contracts/icons/resource.png#3830f1ce8cb07f7757dbcf383b1ec1b11914ac34a1f9d8b065f07600fa9dac19
---

{{payer}} buys MEM on behalf of {{receiver}} by paying {{quant}}. This transaction will incur a 0.5% fee out of {{quant}} and the amount of MEM delivered will depend on market rates.

<h1 class="contract">canceldelay</h1>

---
spec_version: "0.2.0"
title: Cancel Delayed Transaction
summary: '{{nowrap canceling_auth.actor}} cancels a delayed transaction'
icon: http://127.0.0.1/ricardian_assets/inery.contracts/icons/account.png#3d55a2fc3a5c20b456f5657faf666bc25ffd06f4836c5e8256f741149b0b294f
---

{{canceling_auth.actor}} cancels the delayed transaction with id {{trx_id}}.

<h1 class="contract">buymembytes</h1>

---
spec_version: "0.2.0"
title: Buy MEM
summary: '{{nowrap payer}} buys {{nowrap bytes}} bytes of MEM on behalf of {{nowrap receiver}}'
icon: http://127.0.0.1/ricardian_assets/inery.contracts/icons/resource.png#3830f1ce8cb07f7757dbcf383b1ec1b11914ac34a1f9d8b065f07600fa9dac19
---

{{payer}} buys approximately {{bytes}} bytes of MEM on behalf of {{receiver}} by paying market rates for MEM. This transaction will incur a 0.5% fee and the cost will depend on market rates.


<h1 class="contract">delegatebw</h1>

---
spec_version: "0.2.0"
title: Stake Tokens for NET and/or CPU
summary: 'Stake tokens for NET and/or CPU and optionally transfer ownership'
icon: http://127.0.0.1/ricardian_assets/inery.contracts/icons/resource.png#3830f1ce8cb07f7757dbcf383b1ec1b11914ac34a1f9d8b065f07600fa9dac19
---

{{#if transfer}} {{from}} stakes on behalf of {{receiver}} {{stake_net_quantity}} for NET bandwidth and {{stake_cpu_quantity}} for CPU bandwidth.

Staked tokens will also be transferred to {{receiver}}. The sum of these two quantities will be deducted from {{from}}’s liquid balance and add to the vote weight of {{receiver}}.
{{else}}
{{from}} stakes to self and delegates to {{receiver}} {{stake_net_quantity}} for NET bandwidth and {{stake_cpu_quantity}} for CPU bandwidth.

The sum of these two quantities add to the vote weight of {{from}}.
{{/if}}

<h1 class="contract">deleteauth</h1>

---
spec_version: "0.2.0"
title: Delete Account Permission
summary: 'Delete the {{nowrap permission}} permission of {{nowrap account}}'
icon: http://127.0.0.1/ricardian_assets/inery.contracts/icons/account.png#3d55a2fc3a5c20b456f5657faf666bc25ffd06f4836c5e8256f741149b0b294f
---

Delete the {{permission}} permission of {{account}}.



<h1 class="contract">init</h1>

---
spec_version: "0.2.0"
title: Initialize System Contract
summary: 'Initialize system contract'
icon: http://127.0.0.1/ricardian_assets/inery.contracts/icons/admin.png#9bf1cec664863bd6aaac0f814b235f8799fb02c850e9aa5da34e8a004bd6518e
---

Initialize system contract. The core token symbol will be set to {{core}}.

<h1 class="contract">linkauth</h1>

---
spec_version: "0.2.0"
title: Link Action to Permission
summary: '{{nowrap account}} sets the minimum required permission for the {{#if type}}{{nowrap type}} action of the{{/if}} {{nowrap code}} contract to {{nowrap requirement}}'
icon: http://127.0.0.1/ricardian_assets/inery.contracts/icons/account.png#3d55a2fc3a5c20b456f5657faf666bc25ffd06f4836c5e8256f741149b0b294f
---

{{account}} sets the minimum required permission for the {{#if type}}{{type}} action of the{{/if}} {{code}} contract to {{requirement}}.

{{#if type}}{{else}}Any links explicitly associated to specific actions of {{code}} will take precedence.{{/if}}

<h1 class="contract">newaccount</h1>

---
spec_version: "0.2.0"
title: Create New Account
summary: '{{nowrap creator}} creates a new account with the name {{nowrap name}}'
icon: http://127.0.0.1/ricardian_assets/inery.contracts/icons/account.png#3d55a2fc3a5c20b456f5657faf666bc25ffd06f4836c5e8256f741149b0b294f
---

{{creator}} creates a new account with the name {{name}} and the following permissions:

owner permission with authority:
{{to_json owner}}

active permission with authority:
{{to_json active}}


<h1 class="contract">refund</h1>

---
spec_version: "0.2.0"
title: Claim Unstaked Tokens
summary: 'Return previously unstaked tokens to {{nowrap owner}}'
icon: http://127.0.0.1/ricardian_assets/inery.contracts/icons/account.png#3d55a2fc3a5c20b456f5657faf666bc25ffd06f4836c5e8256f741149b0b294f
---

Return previously unstaked tokens to {{owner}} after the unstaking period has elapsed.

<h1 class="contract">regproducer</h1>

---
spec_version: "0.2.0"
title: Register as a Block Producer Candidate
summary: 'Register {{nowrap producer}} account as a block producer candidate'
icon: http://127.0.0.1/ricardian_assets/inery.contracts/icons/voting.png#db28cd3db6e62d4509af3644ce7d377329482a14bb4bfaca2aa5f1400d8e8a84
---

Register {{producer}} account as a block producer candidate.

URL: {{url}}
Location code: {{location}}
Block signing key: {{producer_key}}

## Block Producer Agreement
{{$clauses.BlockProducerAgreement}}

<h1 class="contract">regproducer2</h1>

---
spec_version: "0.2.0"
title: Register as a Block Producer Candidate
summary: 'Register {{nowrap producer}} account as a block producer candidate'
icon: http://127.0.0.1/ricardian_assets/inery.contracts/icons/voting.png#db28cd3db6e62d4509af3644ce7d377329482a14bb4bfaca2aa5f1400d8e8a84
---

Register {{producer}} account as a block producer candidate.

URL: {{url}}
Location code: {{location}}
Block signing authority:
{{to_json producer_authority}}

## Block Producer Agreement
{{$clauses.BlockProducerAgreement}}

<h1 class="contract">regproxy</h1>

---
spec_version: "0.2.0"
title: Register/unregister as a Proxy
summary: 'Register/unregister {{nowrap proxy}} as a proxy account'
icon: http://127.0.0.1/ricardian_assets/inery.contracts/icons/voting.png#db28cd3db6e62d4509af3644ce7d377329482a14bb4bfaca2aa5f1400d8e8a84
---

{{#if isproxy}}
{{proxy}} registers as a proxy that can vote on behalf of accounts that appoint it as their proxy.
{{else}}
{{proxy}} unregisters as a proxy that can vote on behalf of accounts that appoint it as their proxy.
{{/if}}



<h1 class="contract">rmvproducer</h1>

---
spec_version: "0.2.0"
title: Forcibly Unregister a Block Producer Candidate
summary: '{{nowrap producer}} is unregistered as a block producer candidate'
icon: http://127.0.0.1/ricardian_assets/inery.contracts/icons/admin.png#9bf1cec664863bd6aaac0f814b235f8799fb02c850e9aa5da34e8a004bd6518e
---

{{$action.account}} unregisters {{producer}} as a block producer candidate. {{producer}} account will retain its votes and those votes can change based on voter stake changes or votes removed from {{producer}}. However new voters will not be able to vote for {{producer}} while it remains unregistered.

<h1 class="contract">sellres</h1>

---
spec_version: "0.2.0"
title: Sell MEM From Account
summary: 'Sell unused MEM from {{nowrap account}}'
icon: http://127.0.0.1/ricardian_assets/inery.contracts/icons/resource.png#3830f1ce8cb07f7757dbcf383b1ec1b11914ac34a1f9d8b065f07600fa9dac19
---

Sell {{bytes}} bytes of unused MEM from account {{account}} at market price. This transaction will incur a 0.5% fee on the proceeds which depend on market rates.



<h1 class="contract">setabi</h1>

---
spec_version: "0.2.0"
title: Deploy Contract ABI
summary: 'Deploy contract ABI on account {{nowrap account}}'
icon: http://127.0.0.1/ricardian_assets/inery.contracts/icons/account.png#3d55a2fc3a5c20b456f5657faf666bc25ffd06f4836c5e8256f741149b0b294f
---

Deploy the ABI file associated with the contract on account {{account}}.

<h1 class="contract">setacctcpu</h1>

---
spec_version: "0.2.0"
title: Explicitly Manage the CPU Quota of Account
summary: 'Explicitly manage the CPU bandwidth quota of account {{nowrap account}}'
icon: http://127.0.0.1/ricardian_assets/inery.contracts/icons/admin.png#9bf1cec664863bd6aaac0f814b235f8799fb02c850e9aa5da34e8a004bd6518e
---

{{#if_has_value cpu_weight}}
Explicitly manage the CPU bandwidth quota of account {{account}} by pinning it to a weight of {{cpu_weight}}.

{{account}} can stake and unstake, however, it will not change their CPU bandwidth quota as long as it remains pinned.
{{else}}
Unpin the CPU bandwidth quota of account {{account}}. The CPU bandwidth quota of {{account}} will be driven by the current tokens staked for CPU bandwidth by {{account}}.
{{/if_has_value}}

<h1 class="contract">setacctnet</h1>

---
spec_version: "0.2.0"
title: Explicitly Manage the NET Quota of Account
summary: 'Explicitly manage the NET bandwidth quota of account {{nowrap account}}'
icon: http://127.0.0.1/ricardian_assets/inery.contracts/icons/admin.png#9bf1cec664863bd6aaac0f814b235f8799fb02c850e9aa5da34e8a004bd6518e
---

{{#if_has_value net_weight}}
Explicitly manage the network bandwidth quota of account {{account}} by pinning it to a weight of {{net_weight}}.

{{account}} can stake and unstake, however, it will not change their NET bandwidth quota as long as it remains pinned.
{{else}}
Unpin the NET bandwidth quota of account {{account}}. The NET bandwidth quota of {{account}} will be driven by the current tokens staked for NET bandwidth by {{account}}.
{{/if_has_value}}

<h1 class="contract">setacctmem</h1>

---
spec_version: "0.2.0"
title: Explicitly Manage the MEM Quota of Account
summary: 'Explicitly manage the MEM quota of account {{nowrap account}}'
icon: http://127.0.0.1/ricardian_assets/inery.contracts/icons/admin.png#9bf1cec664863bd6aaac0f814b235f8799fb02c850e9aa5da34e8a004bd6518e
---

{{#if_has_value mem_bytes}}
Explicitly manage the MEM quota of account {{account}} by pinning it to {{mem_bytes}} bytes.

{{account}} can buy and sell MEM, however, it will not change their MEM quota as long as it remains pinned.
{{else}}
Unpin the MEM quota of account {{account}}. The MEM quota of {{account}} will be driven by the current MEM holdings of {{account}}.
{{/if_has_value}}

<h1 class="contract">setalimits</h1>

---
spec_version: "0.2.0"
title: Adjust Resource Limits of Account
summary: 'Adjust resource limits of account {{nowrap account}}'
icon: http://127.0.0.1/ricardian_assets/inery.contracts/icons/admin.png#9bf1cec664863bd6aaac0f814b235f8799fb02c850e9aa5da34e8a004bd6518e
---

{{$action.account}} updates {{account}}’s resource limits to have a MEM quota of {{mem_bytes}} bytes, a NET bandwidth quota of {{net_weight}} and a CPU bandwidth quota of {{cpu_weight}}.

<h1 class="contract">setcode</h1>

---
spec_version: "0.2.0"
title: Deploy Contract Code
summary: 'Deploy contract code on account {{nowrap account}}'
icon: http://127.0.0.1/ricardian_assets/inery.contracts/icons/account.png#3d55a2fc3a5c20b456f5657faf666bc25ffd06f4836c5e8256f741149b0b294f
---

Deploy compiled contract code to the account {{account}}.

<h1 class="contract">setparams</h1>

---
spec_version: "0.2.0"
title: Set System Parameters
summary: 'Set System Parameters'
icon: http://127.0.0.1/ricardian_assets/inery.contracts/icons/admin.png#9bf1cec664863bd6aaac0f814b235f8799fb02c850e9aa5da34e8a004bd6518e
---

{{$action.account}} sets system parameters to:
{{to_json params}}

<h1 class="contract">setpriv</h1>

---
spec_version: "0.2.0"
title: Make an Account Privileged or Unprivileged
summary: '{{#if is_priv}}Make {{nowrap account}} privileged{{else}}Remove privileged status of {{nowrap account}}{{/if}}'
icon: http://127.0.0.1/ricardian_assets/inery.contracts/icons/admin.png#9bf1cec664863bd6aaac0f814b235f8799fb02c850e9aa5da34e8a004bd6518e
---

{{#if is_priv}}
{{$action.account}} makes {{account}} privileged.
{{else}}
{{$action.account}} removes privileged status of {{account}}.
{{/if}}

<h1 class="contract">setmem</h1>

---
spec_version: "0.2.0"
title: Configure the Available MEM
summary: 'Configure the available MEM'
icon: http://127.0.0.1/ricardian_assets/inery.contracts/icons/admin.png#9bf1cec664863bd6aaac0f814b235f8799fb02c850e9aa5da34e8a004bd6518e
---

{{$action.account}} configures the available MEM to {{max_mem_size}} bytes.

<h1 class="contract">setmemrate</h1>

---
spec_version: "0.2.0"
title: Set the Rate of Increase of MEM
summary: 'Set the rate of increase of MEM per block'
icon: http://127.0.0.1/ricardian_assets/inery.contracts/icons/admin.png#9bf1cec664863bd6aaac0f814b235f8799fb02c850e9aa5da34e8a004bd6518e
---

{{$action.account}} sets the rate of increase of MEM to {{bytes_per_block}} bytes/block.



<h1 class="contract">setinflation</h1>

---
spec_version: "0.2.0"
title: Set Inflation Parameters
summary: 'Set inflation parameters'
icon: http://127.0.0.1/ricardian_assets/inery.contracts/icons/admin.png#9bf1cec664863bd6aaac0f814b235f8799fb02c850e9aa5da34e8a004bd6518e
---

{{$action.account}} sets the inflation parameters as follows:

* Annual inflation rate (in units of a hundredth of a percent): {{annual_rate}}
* Fraction of inflation used to reward block producers: 10000/{{inflation_pay_factor}}
* Fraction of block producer rewards to be distributed proportional to blocks produced: 10000/{{votepay_factor}}

<h1 class="contract">undelegatebw</h1>

---
spec_version: "0.2.0"
title: Unstake Tokens for NET and/or CPU
summary: 'Unstake tokens for NET and/or CPU from {{nowrap receiver}}'
icon: http://127.0.0.1/ricardian_assets/inery.contracts/icons/resource.png#3830f1ce8cb07f7757dbcf383b1ec1b11914ac34a1f9d8b065f07600fa9dac19
---

{{from}} unstakes from {{receiver}} {{unstake_net_quantity}} for NET bandwidth and {{unstake_cpu_quantity}} for CPU bandwidth.

The sum of these two quantities will be removed from the vote weight of {{receiver}} and will be made available to {{from}} after an uninterrupted 3 day period without further unstaking by {{from}}. After the uninterrupted 3 day period passes, the system will attempt to automatically return the funds to {{from}}’s regular token balance. However, this automatic refund may occasionally fail which will then require {{from}} to manually claim the funds with the refund action.

<h1 class="contract">unlinkauth</h1>

---
spec_version: "0.2.0"
title: Unlink Action from Permission
summary: '{{nowrap account}} unsets the minimum required permission for the {{#if type}}{{nowrap type}} action of the{{/if}} {{nowrap code}} contract'
icon: http://127.0.0.1/ricardian_assets/inery.contracts/icons/account.png#3d55a2fc3a5c20b456f5657faf666bc25ffd06f4836c5e8256f741149b0b294f
---

{{account}} removes the association between the {{#if type}}{{type}} action of the{{/if}} {{code}} contract and its minimum required permission.

{{#if type}}{{else}}This will not remove any links explicitly associated to specific actions of {{code}}.{{/if}}

<h1 class="contract">unregprod</h1>

---
spec_version: "0.2.0"
title: Unregister as a Block Producer Candidate
summary: '{{nowrap producer}} unregisters as a block producer candidate'
icon: http://127.0.0.1/ricardian_assets/inery.contracts/icons/voting.png#db28cd3db6e62d4509af3644ce7d377329482a14bb4bfaca2aa5f1400d8e8a84
---

{{producer}} unregisters as a block producer candidate. {{producer}} account will retain its votes and those votes can change based on voter stake changes or votes removed from {{producer}}. However new voters will not be able to vote for {{producer}} while it remains unregistered.


<h1 class="contract">updateauth</h1>

---
spec_version: "0.2.0"
title: Modify Account Permission
summary: 'Add or update the {{nowrap permission}} permission of {{nowrap account}}'
icon: http://127.0.0.1/ricardian_assets/inery.contracts/icons/account.png#3d55a2fc3a5c20b456f5657faf666bc25ffd06f4836c5e8256f741149b0b294f
---

Modify, and create if necessary, the {{permission}} permission of {{account}} to have a parent permission of {{parent}} and the following authority:
{{to_json auth}}


<h1 class="contract">updtrevision</h1>

---
spec_version: "0.2.0"
title: Update System Contract Revision Number
summary: 'Update system contract revision number'
icon: http://127.0.0.1/ricardian_assets/inery.contracts/icons/admin.png#9bf1cec664863bd6aaac0f814b235f8799fb02c850e9aa5da34e8a004bd6518e
---

{{$action.account}} advances the system contract revision number to {{revision}}.

<h1 class="contract">makeprod</h1>

---
spec_version: "0.2.0"
title: Vote for Block Producers
summary: '{{nowrap voter}} votes for {{#if proxy}}the proxy {{nowrap proxy}}{{else}}up to 30 block producer candidates{{/if}}'
icon: http://127.0.0.1/ricardian_assets/inery.contracts/icons/voting.png#db28cd3db6e62d4509af3644ce7d377329482a14bb4bfaca2aa5f1400d8e8a84
---

{{#if proxy}}
{{voter}} votes for the proxy {{proxy}}.
At the time of voting the full weight of voter’s staked (CPU + NET) tokens will be cast towards each of the producers voted by {{proxy}}.
{{else}}
{{voter}} votes for the following block producer candidates:

{{#each producers}}
  + {{this}}
{{/each}}

At the time of voting the full weight of voter’s staked (CPU + NET) tokens will be cast towards each of the above producers.
{{/if}}


