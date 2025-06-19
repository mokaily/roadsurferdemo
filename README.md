# Roadsurfer Demo Project.

Roadsurfer Demo Project.

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
