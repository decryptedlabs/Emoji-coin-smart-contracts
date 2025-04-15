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