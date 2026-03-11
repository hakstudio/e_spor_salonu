# E-Spor Salonu

Flutter ile geliştirilmiş bir E-Spor Salonu yönetim uygulaması.

> 🇬🇧 For the **English** version, please see [README.md](README.md).

## Özellikler
- **Kullanıcı Girişi:** Güvenli oturum açma sistemi.
- **Hesap Yönetimi:** Kullanıcı hesap detaylarının görüntülenmesi ve yönetimi.
- **Ürün Mağazası:** Mevcut ürün ve hizmetlerin listelenmesi.
- **Satın Alma ve Ödeme:** Ürün satın alma ve ödeme işlemlerinin yapılması.
- **Ayrılma ve Çıkış İşlemleri:** Uygulama içi çıkış/ayrılma süreçlerinin yönetilmesi.

## Teknolojiler
- **Altyapı:** [Flutter](https://flutter.dev/)
- **Dil:** Dart
- **Temel Paketler:**
  - `http` (Ağ istekleri için)
  - `intl` (Tarih ve zaman formatlama için)
  - `flutter_widget_from_html` (HTML içeriklerini göstermek için)
  - `cupertino_icons` (iOS tarzı ikonlar için)

## Başlarken

### Gereksinimler
- Flutter SDK (>=3.1.2 <4.0.0)
- Dart SDK
- Emülatörler/simülatörler için Android Studio veya Xcode.

### Kurulum
1. Projeyi klonlayın:
   ```bash
   git clone <repository_url>
   ```
2. Proje dizinine gidin:
   ```bash
   cd e_spor_salonu
   ```
3. Bağımlılıkları yükleyin:
   ```bash
   flutter pub get
   ```

### Yapılandırma
Eğer arka uç (backend) sunucunuz farklı bir yerel ağda veya sunucuda çalışıyorsa, `lib/main.dart` dosyasındaki IP adresini güncelleyin:
```dart
static String server = "http://192.168.1.100:8080";
```

### Uygulamayı Çalıştırma
Uygulamayı sanal bir cihazda veya fiziksel bir cihazda çalıştırmak için:
```bash
flutter run
```

## Proje Yapısı
- `lib/model/`: Veri modellerini içerir (`User`, `Product`, `Login`).
- `lib/view/`: Kullanıcı arayüzü ekranlarını içerir (`LoginView`, `MainView`, `AccountView`, vb.).

## Lisans
Bu proje şimdilik herhangi bir açık kaynak lisansına sahip değildir. Lütfen depo sahibi ile iletişime geçin.
