# 🕷️ DeepStalk

A high-performance web crawler written in Rust, designed for efficient and reliable web scraping with support for Tor network integration.

## ✨ Features

- 🚀 Fast and efficient web crawling using Rust
- 🔍 HTML parsing and processing capabilities
- 🕸️ Tor network support for anonymous crawling
- 🐳 Docker containerization for easy deployment
- 🌸 Bloom filter implementation for efficient URL tracking
- ⚡ Asynchronous operation with Tokio runtime

## 📋 Prerequisites

- 🦀 Rust (latest stable version)
- 🐳 Docker and Docker Compose (for containerized deployment)
- 🔒 Tor (for anonymous crawling)

## 🛠️ Installation

### Local Development

1. Clone the repository:
```bash
git clone https://github.com/yourusername/DeepStalk.git
cd DeepStalk
```

2. Build the project:
```bash
cargo build --release
```

### Docker Deployment

1. Build and run using Docker Compose:
```bash
docker-compose up --build
```

## 🚀 Usage

### Running Locally

```bash
./target/release/crawle-rs
```

### Running with Input Control

The project includes a utility script `run_with_input.sh` that allows for automated control of the crawler:

```bash
./run_with_input.sh
```

This script:
- 🎮 Runs the crawler in the background
- ⏱️ Automatically sends 'q' input every minute
- 🔄 Provides a way to gracefully control the crawler's operation

### Running with Docker

```bash
docker run -it deepstalk
```

## 📁 Project Structure

- 📂 `src/` - Source code directory
- 📦 `target/` - Build output directory
- 🐳 `Dockerfile` - Container configuration
- 🐳 `docker-compose.yml` - Docker Compose configuration
- 📄 `Cargo.toml` - Rust project configuration and dependencies

## 📦 Dependencies

- 🌸 fastbloom - For efficient URL tracking
- 🔍 html5ever - HTML parsing
- 🧩 lol_html - HTML processing
- 🌐 reqwest - HTTP client
- ⚡ tokio - Asynchronous runtime
- 🔗 url - URL parsing and manipulation

## 📜 License

This project is licensed under the terms of the license included in the repository.

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 🔒 Security

This project includes Tor network support for anonymous crawling. Please use responsibly and in accordance with applicable laws and regulations. 