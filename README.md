With Docker

1. To build the image.
sudo docker build -t aptos-cli .
🔍 Breakdown:
docker build: Tells Docker to build an image from a set of instructions.

-t aptos-cli: Tags (names) the image as aptos-cli, so you can run it later using that name.

.: Tells Docker to look in the current folder for a file named Dockerfile.

In short: this command builds a Docker image called aptos-cli using the instructions you wrote inside a file called Dockerfile.


2. To compile the contracts.

sudo docker run -it --rm \
  -v "$PWD":/aptos \
  -w /aptos/emojicoin_dot_fun \
  aptos-cli move compile --dev

3. To test the contracts.

sudo docker run -it --rm -v "$PWD":/aptos -w /aptos/emojicoin_dot_fun aptos-cli move test


For windows
 
docker-compose up -d
docker-compose exec aptos aptos move compile --dev
docker-compose exec aptos aptos move test
docker-compose down


Without Docker

aptos move compile --dev
aptos move test --dev
aptos node run-local-testnet --with-faucet

Start Aptos Localnet
aptos node run-local-testnet --with-faucet --force-restart

Create a local account
aptos init (This creates .aptos/config.yaml with keys and localnet settings)
aptos init --profile emojicoin-devnet-(pass number here)

Fund your account from the local faucet
aptos account fund-with-faucet --account default
Fund your account from the devnet faucet
aptos account fund-with-faucet --profile emojicoin-devnet-4 --amount 500000000

Check Balance of wallet
aptos account balance --profile emojicoin-devnet-4

Build your Move contract
aptos move compile

Publish to localnet
aptos move publish --override-size-check --assume-yes --included-artifacts none --max-gas 1000000

Publish to devnet
aptos move publish \
  --assume-yes \
  --included-artifacts=none \
  --max-gas 2000000 \
  --named-addresses emojicoin_dot_fun=0x7ea664949ef6b094eb6e66c8089534d8b0aeb62785613f61e26c3e93345433c9 \
  --profile emojicoin-devnet-4 \
  --override-size-check


Call register_market function
aptos move run \
  --function-id 0x7ea664949ef6b094eb6e66c8089534d8b0aeb62785613f61e26c3e93345433c9::emojicoin_dot_fun::register_market \
  --args \
    hex:4d6f6e65794d757474 \   
    hex:4d757474 \
    address:0x5df39f893dcbb17631cff37a0b7b848d0397deb2ec23228213fd1245510aedd9 \
  --profile emojicoin-devnet-4

With the vector<vector<u8>>
aptos move run \
  --function-id 0x16cc09713e922768137889fe11bfab55a6ba1d4c5c35541b7920741f30f81a81::emojicoin_dot_fun::register_market \
  --args \
    raw:0x010a4d6f6e6579204d757474 \
    address:0x5df39f893dcbb17631cff37a0b7b848d0397deb2ec23228213fd1245510aedd9 \
  --profile emojicoin-devnet-5


call swap function to buy tokens
aptos move run \
  --function-id 0xb066504f60719b6c53714c7a8d06a6ee6bb1a79994a2e53175c3ffb7b6ce7e99(this is the contract address)::emojicoin_dot_fun::swap \
  --type-args \
    0x6c12694704e7f8e8eedd455f7b25edddad0ad91f25742844eb59d46b043a7ed8(this is the market address)::coin_factory::Movementcoin \
    0x6c12694704e7f8e8eedd455f7b25edddad0ad91f25742844eb59d46b043a7ed8::coin_factory::MovementcoinLP \
  --args \
    address:0x6c12694704e7f8e8eedd455f7b25edddad0ad91f25742844eb59d46b043a7ed8 \
    u64:1000000 \
    bool:false \
    address:0x5df39f893dcbb17631cff37a0b7b848d0397deb2ec23228213fd1245510aedd9 \
    u8:0 \
    u64:1 \
  --profile emojicoin-devnet-4

  call swap function to sell tokens
aptos move run \
  --function-id 0xb066504f60719b6c53714c7a8d06a6ee6bb1a79994a2e53175c3ffb7b6ce7e99::emojicoin_dot_fun::swap \
  --type-args \
    0xead62d136413c4ca37c625994532a2168b5e660c1fa4176897b68fcbde8bb4b0::coin_factory::Movementcoin \
    0xead62d136413c4ca37c625994532a2168b5e660c1fa4176897b68fcbde8bb4b0::coin_factory::MovementcoinLP \
  --args \
    address:0xead62d136413c4ca37c625994532a2168b5e660c1fa4176897b68fcbde8bb4b0 \
    u64:10000000000 \
    bool:true \
    address:0x5df39f893dcbb17631cff37a0b7b848d0397deb2ec23228213fd1245510aedd9 \
    u8:0 \
    u64:1 \
  --profile emojicoin-devnet-4


hex to string:
4d6f6e65794d757474 = MoneyMutt
4d757474 = Mutt


