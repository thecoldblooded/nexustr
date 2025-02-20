#!/bin/bash

echo "🚀 Nexus Testnet Node Kurulumu Başlıyor..."
sleep 2

# 1️⃣ Gerekli Bağımlılıkların Yüklenmesi
echo "📦 Gerekli bağımlılıklar yükleniyor..."
apt update && apt upgrade -y
apt install -y curl wget git unzip build-essential pkg-config libssl-dev cmake gcc g++ make screen

# 2️⃣ Rust Kurulumu
echo "🦀 Rust yükleniyor..."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source $HOME/.cargo/env
rustup target add riscv32i-unknown-none-elf
echo "✅ Rust sürümü: $(rustc --version)"

# 3️⃣ Güncel Protobuf (protoc) Yükleme
echo "⬇️ Güncel protobuf indiriliyor..."
mkdir -p /tmp/protoc_install && cd /tmp/protoc_install
wget -q https://github.com/protocolbuffers/protobuf/releases/download/v21.12/protoc-21.12-linux-x86_64.zip
unzip -q protoc-21.12-linux-x86_64.zip -d /usr/local
export PATH="/usr/local/bin:$PATH"
echo "✅ Protobuf sürümü: $(protoc --version)"

# 4️⃣ Swap (Bellek) Problemini Önleme (2GB Swap)
echo "🔄 2GB Swap ekleniyor..."
fallocate -l 2G /swapfile
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
echo '/swapfile swap swap defaults 0 0' | tee -a /etc/fstab
echo "✅ 2GB Swap eklendi!"

# 5️⃣ Nexus CLI Kurulumu (En Sona Alındı)
echo "🌐 Nexus CLI yükleniyor..."
curl https://cli.nexus.xyz/ | sh
echo "✅ Nexus CLI kuruldu!"

# 6️⃣ Nexus Node’u `screen` İçinde Başlatma
echo "🎯 Nexus Node'u başlatılıyor (screen ile arka planda çalışacak)..."
screen -dmS nexus /root/.nexus/network-api/clients/cli/target/release/nexus-network start

echo "✅ Kurulum Tamamlandı! 🚀"
echo "💡 Nexus Node'un çalıştığını kontrol etmek için: screen -r nexus"
echo "🔗 Bağlantıyı kapatsan bile süreç devam eder!"
