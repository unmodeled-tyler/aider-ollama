# aider-ollama-launcher

🚀 **An interactive model selector for using [Aider](https://aider.chat) with [Ollama](https://ollama.ai)**

Tired of typing `aider --model ollama/some-long-model-name:tag` every time? This simple wrapper gives you a beautiful interactive menu to select from all your available Ollama models.

![Demo](demo.gif)

## Features

- 🎯 **Interactive Selection** - Use arrow keys to browse, type to fuzzy-search
- ⚡ **Fast** - Fetches models directly from Ollama API
- 🔧 **Configurable** - Works with custom Ollama endpoints and virtual environments
- 📦 **Zero Config** - Works out of the box with sensible defaults

## Prerequisites

- [Aider](https://aider.chat) (`pip install aider-chat`)
- [Ollama](https://ollama.ai) running locally
- `fzf` - fuzzy finder
- `jq` - JSON processor
- `curl`

### Installing Dependencies

**Ubuntu/Debian:**
```bash
sudo apt-get install fzf jq curl
pip install aider-chat
```

**macOS:**
```bash
brew install fzf jq curl
pip install aider-chat
```

**Arch Linux:**
```bash
sudo pacman -S fzf jq curl
pip install aider-chat
```

## Installation

### Option 1: Quick Install (Recommended)

```bash
# Download the script
curl -o ~/.local/bin/aider-ollama https://raw.githubusercontent.com/YOUR_USERNAME/aider-ollama-launcher/main/aider-ollama
chmod +x ~/.local/bin/aider-ollama

# Add to your shell config (bash)
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
echo 'export OLLAMA_API_BASE=http://localhost:11434' >> ~/.bashrc
source ~/.bashrc
```

### Option 2: Clone the Repo

```bash
git clone https://github.com/YOUR_USERNAME/aider-ollama-launcher.git
cd aider-ollama-launcher
./install.sh
```

## Usage

Simply run:

```bash
aider-ollama
```

You'll see a list of all your Ollama models. Use arrow keys to navigate, type to filter, and press Enter to select.

### Pass Arguments to Aider

Any arguments after `aider-ollama` are passed directly to aider:

```bash
# Start without git integration
aider-ollama --no-git

# Start with specific files
aider-ollama main.py utils.py

# Use architect mode
aider-ollama --architect
```

### Create an Alias

Add this to your `~/.bashrc` or `~/.zshrc` for even quicker access:

```bash
alias aider='aider-ollama'
```

Now just type `aider` and you'll get the model selector!

## Configuration

### Environment Variables

| Variable | Default | Description |
|----------|---------|-------------|
| `OLLAMA_API_BASE` | `http://localhost:11434` | Ollama API endpoint |
| `AIDER_VENV` | (none) | Path to aider's virtualenv (if not in PATH) |

### Examples

```bash
# Use a remote Ollama server
export OLLAMA_API_BASE=http://192.168.1.100:11434

# Use aider from a specific virtualenv
export AIDER_VENV=/home/user/aider/.venv
```

## How It Works

1. Queries Ollama's `/api/tags` endpoint to list available models
2. Displays them in an interactive `fzf` menu
3. Prepends `ollama/` to your selection and launches aider

## Troubleshooting

### "Could not connect to Ollama"

Make sure Ollama is running:
```bash
ollama serve
```

### "No models found"

Pull some models first:
```bash
ollama pull llama3.2
ollama pull codellama
ollama pull deepseek-coder
```

### "aider is not installed"

Install aider:
```bash
pip install aider-chat
```

Or if using a virtualenv, set `AIDER_VENV`:
```bash
export AIDER_VENV=/path/to/your/aider/.venv
```

## Contributing

Contributions welcome! Feel free to open issues or PRs.

## License

MIT License - see [LICENSE](LICENSE)

## Credits

- [Aider](https://aider.chat) - AI pair programming in your terminal
- [Ollama](https://ollama.ai) - Run LLMs locally
- [fzf](https://github.com/junegunn/fzf) - A command-line fuzzy finder
