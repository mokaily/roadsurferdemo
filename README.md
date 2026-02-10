# Roadsurfer Demo Project.
Live Demo: https://mokaily.github.io/roadsurferdemo/

## Screenshots
![roadsurfer](https://github.com/user-attachments/assets/ad4b8a2e-57b5-46d1-9744-bb9e6b33d066)


## ✨ Features

This Flutter demo app showcases a responsive campsite discovery experience with the following features:

- 🌍 **Multi-language support**  
  Available in **German (DE)** and **English (EN)**.

- 📱 **Responsive design**  
  Optimized for **Web**, **Tablet**, and **Mobile** layouts using Flutter’s adaptive UI capabilities.

- 🔍 **Advanced filtering & sorting**
    - Filter campsites by **price range**
    - Filter by **features**
    - Filter by **language**
    - Sort results to quickly find the best match

- 🏕️ **Campsite discovery**
  Navigate through campsites and explore the **best available offers near you**.

- 🔎 **Search by campsite name**
  Quickly find campsites using a text-based search.

---

## 🧱 Architecture & Code Quality

- 🧼 **Clean Architecture**
  The project follows **Clean Architecture principles**, with a clear separation between:
    - Presentation layer
    - Domain layer
    - Data layer

- 🌊 **State Management with Riverpod**
  Uses **Riverpod** for predictable state management, dependency injection, and improved testability.

- 🧪 **Unit Testing**
  Core business logic and key components are covered by **unit tests**.

- 🔄 **CI/CD with GitHub Actions**
  Automated **builds, tests, and checks** are configured using **GitHub Actions** to ensure code quality and consistency on every push and pull request.

---

<img src="https://i1.wp.com/resocoder.com/wp-content/uploads/2019/08/CleanArchitecture.jpg" alt="Clean Architecture" width="750"/>

# Final Architecture

<img src="https://i1.wp.com/resocoder.com/wp-content/uploads/2019/08/Clean-Architecture-Flutter-Diagram.png">

## Required Folder Structure.
```
├───lib/
│   ├───core/
│   ├───features/
│   │   └───capmsites/
│   │       ├───data/
│   │       │   ├───data_sources/
│   │       │   ├───models/
│   │       │   └───repositories/
│   │       ├───domain/
│   │       │   ├───entities/
│   │       │   ├───enuma/
│   │       │   ├───repositories/
│   │       │   └───use_cases/
│   │       └───presentation/
│   │           ├───providers/
│   │           ├───pages/
│   │           └───widgets/
.   └───main.dart
```

Simple Demonstration of Folder Structure as per Clean Architecture

# Generated mock classes

Generate the mocks running one of the following commands:

```
flutter pub run build_runner build
``` 

``` 
flutter pub run build_runner build --delete-conflicting-outputs
```

# Generate translation

```
flutter gen-l10n
``` 
