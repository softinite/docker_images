# Gemini CLI Docker Image

This Docker image contains the Google Gemini CLI tool (`@google/gemini-cli`) based on Node.js LTS (Trixie).

## Building the Image

To build the Docker image, run:

```bash
./buildImage.sh [version]
```

If no version is specified, it defaults to `latest`.

**Examples:**
```bash
./buildImage.sh
./buildImage.sh 1.0.0
./buildImage.sh latest
```

## Running the Container

To run the container, use:

```bash
./runContainer.sh [version] [host_folder]
```

**Parameters:**
- `version` (optional): The image version to use. Defaults to `latest`.
- `host_folder` (optional): The host folder to mount into the container at `/workspace`. Defaults to `~/Documents/research/ai/gemini`.

**Examples:**
```bash
# Use defaults (latest version, default host folder)
./runContainer.sh

# Specify version only
./runContainer.sh 1.0.0

# Specify both version and host folder
./runContainer.sh 1.0.0 /path/to/your/folder

# Specify only host folder (use latest version)
./runContainer.sh latest /path/to/your/folder
```

## Usage

Once inside the container, the mounted folder will be available at `/workspace`. You can use the Gemini CLI from anywhere in the container:

```bash
gemini --help
```

The container runs in interactive mode with bash, so you can work directly with your files and use the Gemini CLI as needed.

