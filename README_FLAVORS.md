# Flavors Configuration - Todo App

## Overview

This application uses a flavors system to manage different configurations based on the environment (development, staging, production).

## File Structure

```
lib/
├── app.dart                    # Main application widget
├── main_development.dart       # Entry point for development flavor
├── main_staging.dart          # Entry point for staging flavor
├── main_production.dart       # Entry point for production flavor
└── ...
```

## Android Configuration

Flavors are configured in `android/app/build.gradle.kts`:

- **production**: Name "app_name", no suffix
- **staging**: Name "Stg app_name", suffix ".stg"
- **development**: Name "Dev app_name", suffix ".dev"

## How to use flavors

### 1. Development
```bash
flutter run --flavor development -t lib/main_development.dart
```

### 2. Staging
```bash
flutter run --flavor staging -t lib/main_staging.dart
```

### 3. Production
```bash
flutter run --flavor production -t lib/main_production.dart
```

## APK Build

### Development
```bash
flutter build apk --flavor development -t lib/main_development.dart
```

### Staging
```bash
flutter build apk --flavor staging -t lib/main_staging.dart
```

### Production
```bash
flutter build apk --flavor production -t lib/main_production.dart
```

## Benefits

- **Clear separation** of environments
- **Different app names** based on flavor
- **Flexible configuration** for each environment
- **Easy deployment** to different stores or environments

## Customization

Each flavor can be customized for:
- Loading different configuration files
- Initializing specific services
- Displaying debug/staging information
- Using different API endpoints
