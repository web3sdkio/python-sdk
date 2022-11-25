.PHONY: abi docs

DOCS_SERVER_PORT = 8087

clean-env:
	rm -rf .venv
	poetry shell

init:
	poetry install
	poetry run yarn add hardhat
	poetry run pip3 install eth-brownie

test:
	poetry run brownie test --network hardhat

abi:
	# If you regenerate registry ABI, you will need to fix a typing error
	# abi-gen --language Python -o web3sdkio/abi --abis abi/TWRegistry.json && mv web3sdkio/abi/t_w_registry/__init__.py web3sdkio/abi/t_w_registry.py && rm -rf web3sdkio/abi/t_w_registry
	abi-gen --language Python -o web3sdkio/abi --abis abi/TWFactory.json && mv web3sdkio/abi/t_w_factory/__init__.py web3sdkio/abi/t_w_factory.py && rm -rf web3sdkio/abi/t_w_factory
	abi-gen --language Python -o web3sdkio/abi --abis abi/TokenERC20.json && mv web3sdkio/abi/token_erc20/__init__.py web3sdkio/abi/token_erc20.py && rm -rf web3sdkio/abi/token_erc20
	abi-gen --language Python -o web3sdkio/abi --abis abi/TokenERC721.json && mv web3sdkio/abi/token_erc721/__init__.py web3sdkio/abi/token_erc721.py && rm -rf web3sdkio/abi/token_erc721
	abi-gen --language Python -o web3sdkio/abi --abis abi/TokenERC1155.json && mv web3sdkio/abi/token_erc1155/__init__.py web3sdkio/abi/token_erc1155.py && rm -rf web3sdkio/abi/token_erc1155
	abi-gen --language Python -o web3sdkio/abi --abis abi/Marketplace.json && mv web3sdkio/abi/marketplace/__init__.py web3sdkio/abi/marketplace.py && rm -rf web3sdkio/abi/marketplace
	abi-gen --language Python -o web3sdkio/abi --abis abi/IERC165.json && mv web3sdkio/abi/ierc165/__init__.py web3sdkio/abi/ierc165.py && rm -rf web3sdkio/abi/ierc165
	abi-gen --language Python -o web3sdkio/abi --abis abi/IERC20.json && mv web3sdkio/abi/ierc20/__init__.py web3sdkio/abi/ierc20.py && rm -rf web3sdkio/abi/ierc20
	abi-gen --language Python -o web3sdkio/abi --abis abi/IERC721.json && mv web3sdkio/abi/ierc721/__init__.py web3sdkio/abi/ierc721.py && rm -rf web3sdkio/abi/ierc721
	abi-gen --language Python -o web3sdkio/abi --abis abi/IERC1155.json && mv web3sdkio/abi/ierc1155/__init__.py web3sdkio/abi/ierc1155.py && rm -rf web3sdkio/abi/ierc1155
	abi-gen --language Python -o web3sdkio/abi --abis abi/DropERC721.json && mv web3sdkio/abi/drop_erc721/__init__.py web3sdkio/abi/drop_erc721.py && rm -rf web3sdkio/abi/drop_erc721
	abi-gen --language Python -o web3sdkio/abi --abis abi/DropERC1155.json && mv web3sdkio/abi/drop_erc1155/__init__.py web3sdkio/abi/drop_erc1155.py && rm -rf web3sdkio/abi/drop_erc1155
	abi-gen --language Python -o web3sdkio/abi --abis abi/Multiwrap.json && mv web3sdkio/abi/multiwrap/__init__.py web3sdkio/abi/multiwrap.py && rm -rf web3sdkio/abi/multiwrap
	
	abi-gen --language Python -o web3sdkio/abi --abis abi/SignatureMintERC20.json && mv web3sdkio/abi/signature_mint_erc20/__init__.py web3sdkio/abi/signature_mint_erc20.py && rm -rf web3sdkio/abi/signature_mint_erc20
	abi-gen --language Python -o web3sdkio/abi --abis abi/SignatureMintERC721.json && mv web3sdkio/abi/signature_mint_erc721/__init__.py web3sdkio/abi/signature_mint_erc721.py && rm -rf web3sdkio/abi/signature_mint_erc721
	abi-gen --language Python -o web3sdkio/abi --abis abi/SignatureMintERC1155.json && mv web3sdkio/abi/signature_mint_erc1155/__init__.py web3sdkio/abi/signature_mint_erc1155.py && rm -rf web3sdkio/abi/signature_mint_erc1155

	abi-gen --language Python -o web3sdkio/abi --abis abi/ContractMetadataRegistry.json && mv web3sdkio/abi/contract_metadata_registry/__init__.py web3sdkio/abi/contract_metadata_registry.py && rm -rf web3sdkio/abi/contract_metadata_registry
	abi-gen --language Python -o web3sdkio/abi --abis abi/Web3sdkioContract.json && mv web3sdkio/abi/web3sdkio_contract/__init__.py web3sdkio/abi/web3sdkio_contract.py && rm -rf web3sdkio/abi/web3sdkio_contract

	abi-gen --language Python -o web3sdkio/abi --abis abi/ITokenERC20.json && mv web3sdkio/abi/i_token_erc20/__init__.py web3sdkio/abi/i_token_erc20.py && rm -rf web3sdkio/abi/i_token_erc20
	abi-gen --language Python -o web3sdkio/abi --abis abi/ITokenERC721.json && mv web3sdkio/abi/i_token_erc721/__init__.py web3sdkio/abi/i_token_erc721.py && rm -rf web3sdkio/abi/i_token_erc721
	abi-gen --language Python -o web3sdkio/abi --abis abi/ITokenERC1155.json && mv web3sdkio/abi/i_token_erc1155/__init__.py web3sdkio/abi/i_token_erc1155.py && rm -rf web3sdkio/abi/i_token_erc1155

	abi-gen --language Python -o web3sdkio/abi --abis abi/IPermissionsEnumerable.json && mv web3sdkio/abi/i_permissions_enumerable/__init__.py web3sdkio/abi/i_permissions_enumerable.py && rm -rf web3sdkio/abi/i_permissions_enumerable
	abi-gen --language Python -o web3sdkio/abi --abis abi/IPrimarySale.json && mv web3sdkio/abi/i_primary_sale/__init__.py web3sdkio/abi/i_primary_sale.py && rm -rf web3sdkio/abi/i_primary_sale
	abi-gen --language Python -o web3sdkio/abi --abis abi/IPlatformFee.json && mv web3sdkio/abi/i_platform_fee/__init__.py web3sdkio/abi/i_platform_fee.py && rm -rf web3sdkio/abi/i_platform_fee
	abi-gen --language Python -o web3sdkio/abi --abis abi/IRoyalty.json && mv web3sdkio/abi/i_royalty/__init__.py web3sdkio/abi/i_royalty.py && rm -rf web3sdkio/abi/i_royalty


snippets:
	poetry run python3 scripts/generate_snippets.py

docs:
	cd docs && rm -rf pydoc-markdown && rm -rf docs
	cd docs && poetry run pydoc-markdown
	mv docs/build/docs docs/pydoc-markdown
	rm -rf docs/build
	cp -R docs/pydoc-markdown/content docs/docs
	cp docs/common/index.md docs/docs/index.md
	cp docs/common/custom.md docs/docs/custom.md
	make snippets

publish:
	poetry version prerelease
	rm -rf dist
	poetry build
	poetry publish

live-docs:
	make docs
	xdg-open http://localhost:$(DOCS_SERVER_PORT) || open http://localhost:$(DOCS_SERVER_PORT) || start http://localhost:$(DOCS_SERVER_PORT)
	cd docs/pydoc-markdown && poetry run mkdocs serve --dev-addr localhost:$(DOCS_SERVER_PORT)

test-docker:
	cp docs.Dockerfile Dockerfile
	docker build --no-cache -t docker-test .
	docker run -dp 3000:3000 docker-test