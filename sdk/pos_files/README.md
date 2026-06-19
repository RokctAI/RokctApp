# Foodyman POS

A Flutter-based Point of Sale (POS) system designed for restaurants and food businesses. It supports multiple platforms including Android, iOS, and Desktop.

## Features

- **Point of Sale Interface**: Efficient order management.
- **Kitchen Management**: Specific features for kitchen workflow.
- **Printing**: Integrated thermal printer support for receipts.
- **Maps & Location**: Location services for delivery or store location.
- **Authentication**: Secure login and user management.
- **Dark/Light Mode**: Theming support.

## Tech Stack

- **Framework**: Flutter
- **Language**: Dart
- **State Management**: Riverpod & Provider
- **Navigation**: AutoRoute
- **Networking**: Dio
- **Maps**: Google Maps Flutter & OSM Nominatim
- **Local Storage**: Shared Preferences
- **Dependency Injection**: GetIt

## Getting Started

To run the project locally, ensure you have Flutter installed and set up.

1.  **Get Dependencies**
    ```bash
    flutter pub get
    ```

2.  **Run Application**
    ```bash
    flutter run
    ```

## Folder Structure

The project follows a clean architecture within `lib/src`:

-   `core`: Contains utilities, constants, and shared logic.
-   `presentation`: Contains UI components, pages, and theme definitions.
-   `repository`: Handles data fetching and business logic interfaces.
-   `riverpod`: Manages application state.
