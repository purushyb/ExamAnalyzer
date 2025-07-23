# Contributing to Exam Analyzer

First off, thanks for taking the time to contribute! 🎉  
Your contributions make this project better, and we appreciate every pull request, bug report, and idea.

---

## 📌 Table of Contents

1. [Getting Started](#getting-started)
2. [Running the App](#running-the-app)
3. [Project Structure](#project-structure)
4. [Commit Guidelines](#commit-guidelines)
5. [Pull Requests](#pull-requests)
6. [Code of Conduct](#code-of-conduct)
7. [License](#license)

---

## Getting Started

1. Fork the repository
2. Clone your fork:  
   ```bash
   git clone https://github.com/your-username/exam-analyzer.git
   ```
3. Install dependencies:
   ```bash
   flutter pub get
   ```
   
---

## Running the App

Install dependencies:
```bash
flutter pub get
```

To run:
```bash
flutter run
```

To test:
```bash
flutter test
```

---

## Project Structure

- `lib/data`: Services, repositories
- `lib/ui`: Screens, widgets
- `lib/ui/core`: Shared components
- MVVM structure

---

## Commit Guidelines

Use conventional commits:
```
feature: add new pitch graph
bugfix: audio stream not working
refactor: cleanup pitch detection service
docs: update README
```

---

## Pull Requests

Please ensure:

- Your code builds
- You've added relevant tests
- Lint passes (`flutter analyze`, `dart format .`)
- PR uses the [PR template](.github/ISSUE_TEMPLATE/feature_request.yaml), [BUG template](.github/ISSUE_TEMPLATE/bug_report.yaml)

---

## Code of Conduct

Be respectful and constructive. We welcome contributions from everyone. ❤️
