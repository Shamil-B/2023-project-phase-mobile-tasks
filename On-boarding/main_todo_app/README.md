# Task Management Flutter App

## App Screenshot


![App Screenshot](./screenshots/onboarding_page_screenshot.png | width=100)
![App Screenshot](./screenshots/tasks_list_page_screenshot.png | width=100)
![App Screenshot](./screenshots/task_detail_page_screenshot.png | width=100)
![App Screenshot](./screenshots/create_task_page_screenshot.png | width=100)
![App Screenshot](./screenshots/create_task_page_screenshot_2.png | width=100)

This is a task management Flutter app that follows the principles of Clean Architecture. It provides a structured and organized approach to building a robust and maintainable application by separating concerns into different layers and enforcing clear boundaries.

## Table of Contents

- Features
- Architecture
- Data Flow
- Getting Started
- Dependencies
- Contributing
- License

### Features

- Add, edit, and delete tasks.
- Mark tasks as done.
- Categorize tasks with labels.
- Search and filter tasks.
- Clean and intuitive user interface.

### Architecture

This app is built using the Clean Architecture principles, which consists of three main layers:

- Presentation Layer: This layer is responsible for the UI, including widgets, screens, and user interactions. It communicates with the domain layer to fetch and display data.

- Domain Layer: The domain layer contains business logic and use cases. It defines the core functionality of the app and is independent of external frameworks. This layer also defines entities and interfaces for interacting with data.

- Data Layer: The data layer is responsible for handling data sources, such as databases or APIs. It implements the interfaces defined in the domain layer and provides data to the app.

### Data Flow

The data flow in this app follows a unidirectional flow, commonly known as "one-way data flow":

- User interacts with the UI, triggering an action.
- The action is dispatched to the relevant use case in the domain layer.
- The use case processes the action, interacts with repositories, and retrieves necessary data.
- Data is then passed back to the presentation layer through view models or state management.
- The UI is updated based on the received data.
- This ensures a clear and predictable flow of data and actions throughout the app.

### Getting Started

To get started with the app, follow these steps:

- Clone the repository: git clone https://github.com/your-username/task-management-app.git
- Navigate to the project directory: cd Onboarding/task-management-app
- Install dependencies: flutter pub get
- Run the app: flutter run

### Contributing

Contributions are welcome! If you find a bug or have an idea for a new feature, please open an issue or submit a pull request. Make sure to follow the existing code style and guidelines.

License
This project is licensed under the MIT License.
