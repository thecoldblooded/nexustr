# NexusTR 🔺 Nexus Testnet Node Kurulumu (Tek Komut)

✅ Güncellenmiş Nexus Node Kurulum Rehberi (4 vCPU / 8GB RAM Sunucu için Optimize Edildi- 2 vCPU / 4GB AM Sunucularda Sorun Yaşanıyor Güncelleme Sonrası. O yüzden 4/8 Sunucu ile İlerlemek En Mantıklısı.)
Bu rehber, 4 vCPU / 8GB RAM sunucular için tam optimize edilmiştir ve bellek sorunlarını önlemek için 4GB Swap ekler.

✔ Tüm bağımlılıkları otomatik yükler
✔ Nexus CLI’yi kurar ve çalıştırır
✔ Swap’i 4GB yaparak RAM kullanımını optimize eder
✔ screen ile node’u arka planda çalıştırır

---

🚀 Nexus Testnet Node Kurulumu

Bu script, Nexus Testnet Node'unuzu tek komut ile kurar ve sürekli çalışmasını sağlar.Kurulum tamamlandıktan sonra terminali kapatsanız bile screen sayesinde node arka planda çalışmaya devam eder.

📌 Tek Komutla Kurulum

Aşağıdaki komutu terminalde çalıştırarak otomatik kurulumu başlatabilirsiniz:

```bash
wget https://raw.githubusercontent.com/ugurcanETH/NexusTR/main/setup.sh
chmod +x setup.sh
./setup.sh
```

**📌 Kurulum sırasında şu soruya "Y" + ENTER diyerek devam edin:**
```bash
Do you agree to the Nexus Beta Terms of Use (https://nexus.xyz/terms-of-use)? (Y/n)
```

**Kurulum tamamen otomatik olarak tamamlanacaktır ve aşağıdaki ekranı göreceksiniz: 2'ye basıp devam ediyoruz.**
```bash

The Nexus network is a massively-parallelized proof network for executing and proving the Nexus zkVM.

===== Setting up CLI configuration =====

This node is not connected to any account.

[1] Enter '1' to start proving without earning NEX
[2] Enter '2' to start earning NEX by connecting adding your node ID
```

**🔗 Nexus Node ID Bağlantısı (NEX Puan Kazanmak İçin)**

Kurulumdan sonra Nexus ağına bağlanarak NEX puan kazanmak için aşağıdaki adımları uygulayın:

1️⃣ https://app.nexus.xyz/ adresine mail adresinizle veya cüzdanınızla giriş yapın.

2️⃣ Sağ üstteki cüzdan adresine tıklayın ve dişli simgesine basarak cüzdan kelimelerinizi ve private key’inizi yedekleyin.

3️⃣ Sağ menüden "Nodes" sekmesine girin.

4️⃣ +Add Node → Add CLI Node seçeneklerini takip edin.

5️⃣ Ekranda çıkan Node ID’yi kopyalayın.

6️⃣ Terminale dönün ve şu işlemi yapın: [2] yazıp ENTER tuşuna basın. Panelden aldığınız Node ID’yi yapıştırıp ENTER’a basın.

7️⃣ Tebrikler! 🎉 Nexus Node’unuz başarıyla çalışıyor. 🚀**

🔧 Script Ne Yapıyor?

✅ Gerekli tüm bağımlılıkları yükler (Rust, Protobuf, Nexus CLI vb.)

✅ 2GB Swap ekler (2 vCPU / 4GB RAM sunucular için optimize edildi)

✅ Nexus CLI'yi yükler

✅ Nexus Node'u screen içinde başlatır, böylece terminal kapansa bile çalışmaya devam eder

✅ Otomatik çalıştırmak için tam konfigüre edilmiştir


