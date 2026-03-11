# E-Spor Salonu (E-Sports Center)

A mobile application for managing an E-Sports Center, built with Flutter.

> 🇹🇷 Türkçe sürüm için [README.tr.md](README.tr.md) dosyasına göz atın.

## Features
- **User Authentication:** Secure login system.
- **Account Management:** View and manage user account details.
- **Product Store:** Browse and view available products or services.
- **Purchasing & Payments:** Handle purchases and payment processing.
- **Leave Management:** Manage user leaves or exit processes.

## Tech Stack
- **Framework:** [Flutter](https://flutter.dev/)
- **Language:** Dart
- **Key Packages:**
  - `http` (for network requests)
  - `intl` (for date/time formatting)
  - `flutter_widget_from_html` (for rendering HTML content)
  - `cupertino_icons` (for iOS-style icons)

## Getting Started

### Prerequisites
- Flutter SDK (>=3.1.2 <4.0.0)
- Dart SDK
- Android Studio or Xcode for running emulators/simulators.

### Installation
1. Clone the repository:
   ```bash
   git clone <repository_url>
   ```
2. Navigate to the project directory:
   ```bash
   cd e_spor_salonu
   ```
3. Install dependencies:
   ```bash
   flutter pub get
   ```

### Configuration
Update the server IP address in `lib/main.dart` if your backend is hosted elsewhere:
```dart
static String server = "http://192.168.1.100:8080";
```

### Running the App
Run the app on your connected device or emulator:
```bash
flutter run
```

## Project Structure
- `lib/model/`: Contains data models (`User`, `Product`, `Login`).
- `lib/view/`: Contains UI screens (`LoginView`, `MainView`, `AccountView`, `ProductView`, `PaymentView`, `PurchaseView`, `LeaveView`).

## License
This project is unlicensed or uses a proprietary license. Please contact the repository owner for more information.
