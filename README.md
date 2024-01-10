
## Approach

In this assignment, I employed the Stacked architecture, which includes the use of the following folders:

- `lib/view`: Contains the UI components (screens, widgets).
- `lib/viewmodel`: Holds the business logic and interacts with the UI.
- `lib/services`: Manages external services, API calls, etc.
- `lib/models`: Includes data models used throughout the application.

The following packages were used:

- `flutter_lints: ^2.0.0`
- `build_runner`
- `icon_forest: ^1.1.8`
- `stacked: ^3.4.1+1`
- `stacked_services: ^1.3.0`
- `auto_route: ^6.4.0`
- `stacked_generator: ^1.3.3`
- `stacked_hooks: ^0.2.2`
- `easy_widgets: ^0.0.7`
- `logger: ^1.4.0`
- `flutter_screenutil: ^5.9.0`
- `injectable: ^2.3.2`
- `get_storage: ^2.1.1`
- `google_fonts: ^6.1.0`

## How to Run the App

Follow these steps to run the app locally:

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/your-repo.git
   ```
2.Install dependencies:
  ```bash
    flutter pub get
  ``` 
3.Generate necessary files:
   ```bash
flutter pub run build_runner build --delete-conflicting-outputs
```
4.Run the app:
```bash
flutter run
```


