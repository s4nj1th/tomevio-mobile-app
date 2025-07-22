<div align="center">
  <h1>Tomevio Mobile App</h1>
  <p>Flutter mobile app for the Tomevio book tracker platform.</p>
</div>

---

This repo contains the **Flutter** mobile app for **Tomevio**, a FOSS book tracking platform. It connects to the [Tomevio backend](https://github.com/s4nj1th/tomevio-backend) and offers a clean, responsive experience for tracking books on the go.

---

## Features

- **Search Books/Authors** via the backend REST API.
- **Book Details**: View titles, descriptions, authors.
- **Author Info**: See author bios and work count.
- **Cross-platform**: Runs on both Android and iOS.
- **Built in Flutter**: Beautiful UI with smooth performance.

---

## Getting Started

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- Android Studio / Xcode (for Android/iOS builds)

### Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/your-org/tomevio-mobile-app.git
   cd tomevio-mobile-app
   ```

2. Install dependencies:

   ```bash
   flutter pub get
   ```

3. Run the app:

   ```bash
   flutter run
   ```

Make sure a device (emulator or physical) is connected.

---

## Configuration

You can configure the backend URL in `lib/constants.dart`:

```dart
const String apiBaseUrl = 'http://localhost:8080';
```

Update this for production or testing deployments.

---

## Project Structure

- `lib/`: Main app code

  - `screens/`: UI screens
  - `widgets/`: Reusable UI components
  - `services/`: API calls
  - `models/`: Data models

- `assets/`: Images and fonts

---

## Contributing

Pull requests and issues are welcome.
Please:

- Follow Flutter best practices
- Format code with `flutter format`
- Keep logic and UI well-separated

---

## License

Licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

## Maintainers

### Sanjith

- [Github](https://github.com/s4nj1th)
- [Twitter (X)](https://x.com/s4nj1th)
- [Email](mailto:sanjith.develops@gmail.com)
