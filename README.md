<img src="assets/exam-analyzer-logo.png" width="160"
     style="border-radius:50%; border:20px solid white;" />

# 📘 PTE Analyzer 
(code name: Exam Analyzer)

[![Thanks](https://img.shields.io/badge/Thanks-Open%20Source%20Libraries-blue.svg)](#-acknowledgements)

**Exam Analyzer** is a Flutter-based utility that helps users track, analyze, and reflect on their PTE (Pearson Test of English) exam performance. Built with a clean MVVM architecture, it offers visual insights, scoring history, and progress tracking in a privacy-first local environment.

# ⛶ Screenshots
<p float="left">
  <img src="assets/light-theme/dashboard.png" width="200" />
  <img src="assets/light-theme/attempts.png" width="200" />
  <img src="assets/light-theme/attempt-details.png" width="200" />
  <img src="assets/light-theme/realTimePitchDetector.png" width="200" />
  <img src="assets/light-theme/settings.png" width="200" />
</p>
<p float="left">
  <img src="assets/dark-theme/dashboard.png" width="200" />
  <img src="assets/dark-theme/attempts.png" width="200" />
  <img src="assets/dark-theme/attempt-details.png" width="200" />
  <img src="assets/dark-theme/realTimePitchDetector.png" width="200" />
  <img src="assets/dark-theme/settings.png" width="200" />
</p>  

---

## 🖥️ Platform Support

| Platform   | Supported |
|------------|-----------|
| Android    | ✅        |
| iOS        | ✅        |
| macOS      | ⬜ Planned|
| Windows    | ⬜ Planned |
| Linux      | ⬜ Planned |
| Web        | ⬜ Planned |

## 🚀 Features

- 📊 **Dashboard**: Visual overview of past attempts and upcoming exam date  
- ➕ **Attempts**: Add, delete and keep track of user exam attempts  
- 📁 **View Details**: Deep dive into individual attempts with subskill breakdown  
- 📅 **Next Exam**: Track and update your scheduled exam date  
- 🎙️ **audio**: Real-time pronunciation feedback, detect pitch of the user
- 💡 **Offline-first**: All data stored locally using SQLite  

---

## 🧱 Architecture

- **Flutter**: UI layer  
- **MVVM**: ViewModel + Repository pattern for business logic  
- **Provider + flutter_command**: For state management  
- **Freezed & json_serializable**: For immutable models  
- **go_router**: Declarative navigation  

---

## 💻 Installation

```bash
git clone https://github.com/purushyb/exam-analyzer.git
cd exam-analyzer
flutter pub get
flutter run
````
---

## 🤝 Contributions
- We welcome feedback, feature requests, and security disclosures.
- Check [Contributions.md](.github/CONTRIBUTING.md)
- Join our [Discord Community](https://discord.gg/5aWvp7aM) to chat, ask questions, or contribute ideas.

## 📬 Contact Us

Feel free to reach out us in the [Discord Community](https://discord.gg/5aWvp7aM)

## 🙏 Acknowledgements

We’d like to thank the amazing open-source projects that made **Karna Forge** possible:

- The **Flutter Architecture Guide – MVVM Pattern**, for providing guidance on scalable and maintainable app architecture: [Flutter Docs – App Architecture Guide](https://docs.flutter.dev/app-architecture/guide). :contentReference[oaicite:2]{index=2}

- [flutter](https://flutter.dev) – Cross-platform UI toolkit
- [provider](https://pub.dev/packages/provider) – State management
- [freezed](https://pub.dev/packages/freezed) – Immutable models & unions
- [sqflite](https://pub.dev/packages/sqflite) – SQLite database
- [url_launcher](https://pub.dev/packages/url_launcher) – Launching external apps/links
- [permission_handler](https://pub.dev/packages/permission_handler) – Runtime permissions
- [fl_chart](https://pub.dev/packages/fl_chart) – Charts and graphs
- [flutter_audio_capture](https://pub.dev/packages/flutter_audio_capture) – Real-time audio input

