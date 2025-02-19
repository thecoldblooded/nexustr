#!/bin/bash

echo "🚀 Nexus Testnet Node Kurulumu Başlıyor..."
sleep 2

# 1️⃣ Gerekli Paketlerin Yüklenmesi
echo "📦 Gerekli bağımlılıklar yükleniyor..."
apt update && apt upgrade -y
apt install -y curl wget git unzip build-essential pkg-config libssl-dev cmake gcc g++ make

# 2️⃣ Rust Kurulumu
echo "🦀 Rust yükleniyor..."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source $HOME/.cargo/env
rustup target add riscv32i-unknown-none-elf
echo "✅ Rust sürümü: $(rustc --version)"

# 3️⃣ Nexus CLI Kurulumu
echo "🌐 Nexus CLI yükleniyor..."
curl https://cli.nexus.xyz/ | sh
echo "✅ Nexus CLI sürümü: $(nexus --version)"

# 4️⃣ Eski Protobuf (protoc) Kaldırılıyor
echo "🗑️ Eski protobuf sürümü kaldırılıyor..."
apt remove -y protobuf-compiler

# 5️⃣ Güncellenmiş Protobuf (protoc) Yükleniyor
echo "⬇️ Güncel protobuf indiriliyor..."
mkdir -p /tmp/protoc_install && cd /tmp/protoc_install
wget -q https://github.com/protocolbuffers/protobuf/releases/download/v21.12/protoc-21.12-linux-x86_64.zip
unzip -q protoc-21.12-linux-x86_64.zip -d /usr/local
export PATH="/usr/local/bin:$PATH"
echo "✅ Protobuf sürümü: $(protoc --version)"

# 6️⃣ Nexus CLI Yeniden Kuruluyor
echo "🔄 Nexus CLI tekrar yükleniyor..."
curl https://cli.nexus.xyz/ | sh

# 7️⃣ Node ID Bağlantısı
echo "🔗 Nexus Node ID Bağlantısı için aşağıdaki adımları takip edin:"
echo "1. Tarayıcınızdan https://app.nexus.xyz/nodes adresine gidin."
echo "2. Hesabınıza giriş yapın veya yeni bir hesap oluşturun."
echo "3. '+ Add Node' butonuna tıklayın."
echo "4. 'Add CLI Node' seçeneğini seçin."
echo "5. Size verilen Node ID'yi aşağıdaki terminale girin ve ENTER'a basın."

# Nexus CLI'yi başlat ve kullanıcıdan Node ID girmesini iste
nexus-network --start --beta
