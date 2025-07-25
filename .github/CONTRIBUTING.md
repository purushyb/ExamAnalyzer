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
- feature: add new pitch graph
- bugfix: audio stream not working
- refactor: cleanup pitch detection service
- docs: update README
```

---

## Pull Requests

Please ensure:

- Your code builds
- You've added relevant tests
- Lint passes (`flutter analyze`, `dart format .`)
- PR uses the [PR template](.github/ISSUE_TEMPLATE/feature_request.yaml), [BUG template](.github/ISSUE_TEMPLATE/bug_report.yaml)

---

## Reporting Bugs

If you find a bug, please open a new issue using our **[Bug Report Template](./ISSUE_TEMPLATE/bug_report.yaml)**.

Make sure you include:
- A clear, descriptive title.
- Steps to reproduce the bug.
- What you expected to happen.
- What actually happened.

---

## Requesting Features

Have a great idea? We'd love to hear about it! Please open a new issue using our **[Feature Request Template](./ISSUE_TEMPLATE/feature_request.yaml)**.

Your feature request should include:
- A clear description of the feature.
- Why this feature would be useful.
- Any alternative solutions or workarounds you've considered.

## Code of Conduct

Be respectful and constructive. We welcome contributions from everyone. ❤️
