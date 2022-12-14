# inery.contracts

## Version : 1.9.1

The design of the INERY blockchain calls for a number of smart contracts that are run at a privileged permission level in order to support functions such as block producer registration and voting, token staking for CPU and network bandwidth, RAM purchasing, multi-sig, etc.  These smart contracts are referred to as the bios, system, msig, wrap (formerly known as sudo) and token contracts.

This repository contains examples of these privileged contracts that are useful when deploying, managing, and/or using an INERY blockchain.  They are provided for reference purposes:

   * [inery.bios](./contracts/inery.bios)
   * [inery.system](./contracts/inery.system)
   * [inery.msig](./contracts/inery.msig)
   * [inery.wrap](./contracts/inery.wrap)

The following unprivileged contract(s) are also part of the system.
   * [inery.token](./contracts/inery.token)

Dependencies:
* [inery.cdt v1.7.x](https://github.com/INERY/inery.cdt/releases/tag/v1.7.0)
* [inery v2.0.x](https://github.com/INERY/ine/releases/tag/v2.0.1) (optional dependency only needed to build unit tests)

To build the contracts follow the instructions in [`Build and deploy` section](./docs/02_build-and-deploy.md).

## Contributing

[Contributing Guide](./CONTRIBUTING.md)

[Code of Conduct](./CONTRIBUTING.md#conduct)

## License

[MIT](./LICENSE)

The included icons are provided under the same terms as the software and accompanying documentation, the MIT License.  We welcome contributions from the artistically-inclined members of the community, and if you do send us alternative icons, then you are providing them under those same terms.

## Important

See [LICENSE](./LICENSE) for copyright and license terms.

All repositories and other materials are provided subject to the terms of this [IMPORTANT](./IMPORTANT.md) notice and you must familiarize yourself with its terms.  The notice contains important information, limitations and restrictions relating to our software, publications, trademarks, third-party resources, and forward-looking statements.  By accessing any of our repositories and other materials, you accept and agree to the terms of the notice.
