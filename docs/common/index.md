<p align="center">
<br />
<a href="https://web3sdk.io"><img src="https://github.com/web3sdkio/typescript-sdk/blob/main/logo.svg?raw=true" width="200" alt=""/></a>
<br />
</p>
<h1 align="center">Web3sdkio Python SDK</h1>
<p align="center">
<a href="https://pypi.org/project/web3sdkio-sdk/"><img src="https://img.shields.io/pypi/v/web3sdkio-sdk?color=red&logo=pypi&logoColor=red" alt="pypi version"/></a>
<a href="https://github.com/web3sdkio/python-sdk/actions"><img alt="Build Status" src="https://github.com/web3sdkio/python-sdk/actions/workflows/tests.yml/badge.svg"/></a>
<a href="https://discord.gg/web3sdkio"><img alt="Join our Discord!" src="https://img.shields.io/discord/834227967404146718.svg?color=7289da&label=discord&logo=discord&style=flat"/></a>

</p>
<p align="center"><strong>Best in class Web3 SDK for Python 3.7+</strong></p>
<br />

## Installation

```bash
pip install web3sdkio-sdk
```

## Getting Started

To start using this SDK, you just need to pass in a provider configuration.
### Instantiating the SDK

Once you have all the necessary dependencies, you can follow the following setup steps to get started with the SDK read-only functions:

```python
from web3sdkio import Web3sdkioSDK

# You can create a new instance of the SDK to use by just passing in a network name
sdk = Web3sdkioSDK("mumbai")
```

The SDK supports the `mainnet`, `rinkeby`, `goerli`, `polygon`, `mumbai`, `fantom`, and `avalanche` networks.

Alternatively, if you want to use your own custom RPC URL, you can pass in the RPC URL directly as follows:

```python
from web3sdkio import Web3sdkioSDK

# Set your RPC_URL
RPC_URL = "https://rpc-mainnet.matic.network"

# And now you can instantiate the SDK with it
sdk = Web3sdkioSDK(RPC_URL)
```

### Working With Contracts

Once you instantiate the SDK, you can use it to access your web3sdkio contracts. You can use the SDK's contract getter functions like `get_token`, `get_edition`, `get_nft_collection`, and `get_marketplace` to get the respective SDK contract instances. To use an NFT Collection contract for example, you can do the following.

```python
# Add your NFT Collection contract address here
NFT_COLLECTION_ADDRESS = "0x.."

# And you can instantiate your contract with just one line
nft_collection = sdk.get_nft_collection(NFT_COLLECTION_ADDRESS)

# Now you can use any of the read-only SDK contract functions
nfts = nft_collection.get_all()
print(nfts)
```

### Signing Transactions

> :warning: Never commit private keys to file tracking history, or your account could be compromised.

Meanwhile, if you want to use write functions as well and connect a signer, you can use the following setup:

```python
from web3sdkio import Web3sdkioSDK
from web3sdkio.types.nft import NFTMetadataInput
import os


# This PRIVATE KEY is coming from your environment variables. Make sure to never put it in a tracked file or share it with anyone.
PRIVATE_KEY = os.environ.get("PRIVATE_KEY")

# Now you can create a new instance of the SDK with your private key
sdk = Web3sdkioSDK.from_private_key(PRIVATE_KEY, "mumbai")

# Instantiate a new NFT Collection contract as described above.
NFT_COLLECTION_ADDRESS = "0x.."
nft_collection = sdk.get_nft_collection(NFT_COLLECTION_ADDRESS)

# Now you can use any of the SDK contract functions including write functions
nft_collection.mint(NFTMetadataInput.from_json({ "name": "Cool NFT", "description": "Minted with the Python SDK!" }))
```
