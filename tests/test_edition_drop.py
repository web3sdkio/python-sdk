from time import time
from brownie import accounts
import pytest
from web3sdkio.constants.currency import ZERO_ADDRESS
from web3sdkio.constants.role import Role
from web3sdkio.contracts import EditionDrop

from web3sdkio.core.sdk import Web3sdkioSDK
from web3sdkio.types.nft import NFTMetadataInput
from web3sdkio.types.settings.metadata import EditionDropContractMetadata


@pytest.mark.usefixtures("sdk", "primary_account")
@pytest.fixture(scope="function")
def edition_drop(sdk: Web3sdkioSDK, primary_account) -> EditionDrop:
    sdk.update_signer(primary_account)
    edition_drop = sdk.get_edition_drop(
        sdk.deployer.deploy_edition_drop(
            EditionDropContractMetadata(
                name="SDK Edition Drop",
                primary_sale_recipient=sdk.get_signer().address,  # type: ignore
                seller_fee_basis_points=500,
                fee_recipient=ZERO_ADDRESS,
                platform_fee_basis_points=10,
                platform_fee_recipient=ZERO_ADDRESS,
            )
        )
    )
    edition_drop.roles.grant(Role.MINTER, sdk.get_signer().address)  # type: ignore
    return edition_drop


def test_create_batch(edition_drop: EditionDrop):
    metadatas = []
    for i in range(10):
        metadatas.append(NFTMetadataInput(name=f"Edition {i}"))

    edition_drop.create_batch(metadatas)
    nfts = edition_drop.get_all()

    assert len(nfts) == 10

    for i, nft in enumerate(nfts):
        assert nft.metadata.name == f"Edition {i}"

    assert edition_drop.get_total_count() == 10
