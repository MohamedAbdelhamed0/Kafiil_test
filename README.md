# Kafill Test Project

This project is a demonstration of a Flutter application created as a task for a job application. The project includes various screens and widgets showcasing different aspects of Flutter development.

## Features

- **Login Screen**: A screen with email and password fields, a "Remember Me" checkbox, and a "Forgot Password?" link.
- **Registration Screen**: A multi-step form for user registration, including fields for personal information and preferences.
- **Favorite Social Media**: A widget allowing users to select their favorite social media platforms with corresponding logos.
- **Services Photo**: A widget displaying a photo with a badge indicating the number of services.

## Installation

To run this project locally, follow these steps:

1. **Clone the repository**:
    ```bash
    git clone https://github.com/yourusername/kafill_test.git
    cd kafill_test
    ```

2. **Install dependencies**:
    ```bash
    flutter pub get
    ```

3. **Run the app**:
    ```bash
    flutter run
    ```

## Project Structure

The project is structured as follows:

lib/
│
├── auth_screens/
│ ├── login_screen.dart
│ ├── register_screen.dart
│
├── models/
│ └── service.dart
│
├── widgets/
│ ├── circular_avatar_with_add_button.dart
│ ├── countries_capitals_table.dart
│ ├── custom_elevated_button.dart
│ ├── custom_form_field.dart
│ ├── favorite_social_media.dart
│ ├── gender_selection.dart
│ ├── skill_chip.dart
│ └── salary_widget.dart
│
├── colors.dart
└── main.dart


### Auth Screens

- **login_screen.dart**: Contains the login screen with fields for email and password, a "Remember Me" checkbox, and a "Forgot Password?" link.
- **register_screen.dart**: Contains the registration screen with a multi-step form for user registration.

### Models

- **service.dart**: Defines the `Service` model used in the application.

### Widgets

- **circular_avatar_with_add_button.dart**: A widget displaying a circular avatar with an add button.
- **countries_capitals_table.dart**: A widget displaying a table of countries and their capitals.
- **custom_elevated_button.dart**: A custom elevated button widget.
- **custom_form_field.dart**: A custom form field widget for input fields.
- **favorite_social_media.dart**: A widget allowing users to select their favorite social media platforms with logos.
- **gender_selection.dart**: A widget for selecting gender.
- **skill_chip.dart**: A widget displaying skill chips.
- **salary_widget.dart**: A widget displaying salary information.

## Contributing

Contributions are welcome! Please create a pull request or open an issue to discuss the changes you would like to make.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.





