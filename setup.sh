#!/bin/bash

echo "🚀 Nexus Testnet Node Kurulumu Başlıyor..."
sleep 2

# 1️⃣ Gerekli Bağımlılıkların Yüklenmesi
echo "📦 Gerekli bağımlılıklar yükleniyor..."
apt update && apt upgrade -y
apt install -y curl wget git unzip build-essential pkg-config libssl-dev cmake gcc g++ make

# 2️⃣ Rust Kurulumu
echo "🦀 Rust yükleniyor..."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source $HOME/.cargo/env
rustup target add riscv32i-unknown-none-elf
echo "✅ Rust sürümü: $(rustc --version)"

# 3️⃣ Swap (Bellek) Optimizasyonu (4GB)
echo "🛠 Swap alanı oluşturuluyor (4GB)..."
swapoff -a
rm -f /swapfile
fallocate -l 4G /swapfile
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
echo '/swapfile swap swap defaults 0 0' | tee -a /etc/fstab
echo "✅ Swap başarıyla oluşturuldu:"
free -h

# 4️⃣ Güncel Protobuf (protoc) Yükleme
echo "⬇️ Güncel Protobuf (protoc) indiriliyor..."
mkdir -p /tmp/protoc_install && cd /tmp/protoc_install
wget -q https://github.com/protocolbuffers/protobuf/releases/download/v21.12/protoc-21.12-linux-x86_64.zip
unzip -q protoc-21.12-linux-x86_64.zip -d /usr/local
export PATH="/usr/local/bin:$PATH"
echo "✅ Protobuf sürümü: $(protoc --version)"

# 5️⃣ Nexus CLI Kurulumu
echo "🌐 Nexus CLI yükleniyor..."
curl https://cli.nexus.xyz/ | sh
echo "✅ Nexus CLI başarıyla kuruldu!"

