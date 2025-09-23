# Sim IDX Sample Project

This project indexes clankerToken transfers for retaketv tokens. They can be identified with a specific context. 

The indexing uses multiple criteria:

1. Filter for all tokens that conform to the clankerToken ABI (= all clanker tokens)
2. Filter for tokens that have the string `streamm deployment` as value for `messageId` in the token context (= all retaketv tokens)
3. Filter for token transfers with a value > 0.01 ETH

The tokens are on BASE (chain id 8453). Suitable test blocks are:

|   Block   | Tx Hash                                                                   | Comment                             |
|-----------|---------------------------------------------------------------------------|-------------------------------------|
| 35664472  | `0xcc1270c6fcee5a167f23da82898f71eacc76bcf16b5c3bd6f6052f075f759958`      |                                     |
| 35667121  | `0x4f03dac42d4bf709085ddc0fc8e5c674d6a0b75c9231895379115f6fdf4e0fdc`      |                                     |
| 35667724  | `0xec6240a1ac32ad41b6bb33b69ca6ae6afb1e535259ceaecb7b40351eb3a8bc2a`      |                                     |
| 35660292  | `0x62a805b15b9e3dab20975a5f40fb18e9a31fef3b3db41144f549b240b2a8003d`      | single retaketv transfer in block   |
| 35663275  | `0x2f11f56df999316c2df350cae04af87e3f206679fcf3fae8bd3bbcd324a9c5dd`      | "high value" transfer (> 0.001 ETH) |

## Various Addresses

| Human Readable Name         | Address                                      |
|-----------------------------|----------------------------------------------|
| Clanker V4.0.0              | `0xE85A59c628F7d27878ACeB4bf3b35733630083a9` |
| Uniswap V4 PoolManager      | `0x498581fF718922c3f8e6A244956aF099B2652b2b` |
| WETH (Base)                 | `0x4200000000000000000000000000000000000006` |
| Uniswap V4 Quoter (Base)    | `0x0d5e0F971ED27FBfF6c2837bf31316121532048D` |
| Clanker Token from retaketv | `0x07FDD1704dfC9C0BaD59B1f050c9b36f6a239b07` |


## App Structure

```text
.
├── sim.toml                     # App configuration
├── apis/                        # Your custom API code
├── abis/                        # Contract ABI files (JSON)
│   └── UniswapV3Factory.json    # Example: Uniswap V3 Factory ABI
└── listeners/                   # Foundry project for listener contracts
    ├── src/
    │   └── Main.sol             # Triggers contract & listener logic
    └── test/
        └── Main.t.sol           # Unit tests for your listener
```

The `listeners/` directory is a Foundry project where your indexing logic lives. For a detailed breakdown of each file and folder, see the [App Folder Structure](https://docs.sim.dune.com/idx/app-structure) documentation.

## Next Steps

Ready to start building? Check out our comprehensive guides:

-   **[Deploying Your App](https://docs.sim.dune.com/idx/deployment)** - Deploy your app
-   **[Adding ABIs](https://docs.sim.dune.com/idx/cli#sim-abi)** - How to add contract ABIs
-   **[Writing Listeners](https://docs.sim.dune.com/idx/listener)** - Define your indexing logic
-   **[CLI Reference](https://docs.sim.dune.com/idx/cli)** - All available commands