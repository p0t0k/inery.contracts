## How to build the inery.contracts

### Preconditions
Ensure an appropriate version of `inery.cdt` is installed. Installing `inery.cdt` from binaries is sufficient, follow the [`inery.cdt` installation instructions steps](https://github.com/INERY/inery.cdt/tree/master/#binary-releases) to install it. To verify if you have `inery.cdt` installed and its version run the following command 

```sh
inery-cpp -v
```

#### Build contracts using the build script

##### To build contracts alone
Run the `build.sh` script in the top directory to build all the contracts.

##### To build the contracts and unit tests
1. Ensure an appropriate version of `inery` has been built from source and installed. Installing `inery` from binaries `is not` sufficient. You can find instructions on how to do it [here](https://github.com/INERY/ine/blob/master/README.md) in section `Building from Sources`.
2. Run the `build.sh` script in the top directory with the `-t` flag to build all the contracts and the unit tests for these contracts.

#### Build contracts manually

To build the `inery.contracts` execute the following commands.

On all platforms except macOS:
```sh
cd you_local_path_to/inery.contracts/
rm -fr build
mkdir build
cd build
cmake ..
make -j$( nproc )
cd ..
```

For macOS:
```sh
cd you_local_path_to/inery.contracts/
rm -fr build
mkdir build
cd build
cmake ..
make -j$(sysctl -n hw.ncpu)
cd ..
```

#### After build:
* If the build was configured to also build unit tests, the unit tests executable is placed in the _build/tests_ folder and is named __unit_test__.
* The contracts (both `.wasm` and `.abi` files) are built into their corresponding _build/contracts/\<contract name\>_ folder.
* Finally, simply use __cline__ to _set contract_ by pointing to the previously mentioned directory for the specific contract.

## How to deploy the inery.contracts

### To deploy inery.bios contract execute the following command:
Let's assume your account name to which you want to deploy the contract is `testerbios`
```
cline set contract testerbios you_local_path_to/inery.contracts/build/contracts/inery.bios/ -p testerbios
```

### To deploy inery.msig contract execute the following command:
Let's assume your account name to which you want to deploy the contract is `testermsig`
```
cline set contract testermsig you_local_path_to/inery.contracts/build/contracts/inery.msig/ -p testermsig
```

### To deploy inery.system contract execute the following command:
Let's assume your account name to which you want to deploy the contract is `testersystem`
```
cline set contract testersystem you_local_path_to/inery.contracts/build/contracts/inery.system/ -p testersystem
```

### To deploy inery.token contract execute the following command:
Let's assume your account name to which you want to deploy the contract is `testertoken`
```
cline set contract testertoken you_local_path_to/inery.contracts/build/contracts/inery.token/ -p testertoken
```

### To deploy inery.wrap contract execute the following command:
Let's assume your account name to which you want to deploy the contract is `testerwrap`
```
cline set contract testerwrap you_local_path_to/inery.contracts/build/contracts/inery.wrap/ -p testerwrap
```