# Tripee Documentation

## Description

Tripee is a carpooling mobile application designed to facilitate shared rides by enabling users to create, join, and manage trips. The application incorporates features for route creation, reservation management, location tracking via Google Maps, and a real-time messaging module using STOMP. This document provides instructions for setting up and running the project, along with an overview of its architecture and main modules.

## Prerequisites

Before starting, ensure the following requirements are met:

- Clone the project from the repository using the command:
  ```bash
  git clone <repository-url>
  ```
- Change to the project directory:
  ```bash
  cd path/to/project
  ```
- Ensure your development environment is on the same network as the server machine. Connection credentials are specified in the `identifiants_connections_to_backend.dart` file located in the `constants` directory.

## Project Architecture

Tripee is structured to separate concerns across different layers, following best practices for scalable and maintainable code. The main directories include:

### Core Directory

- **Purpose**: Holds common elements such as themes, colors, and custom widgets. This directory centralizes all design elements and reusable utilities, ensuring consistency and easy updates across the application.

### Data Directory

- **Purpose**: This directory contains the application's data models and providers, which are responsible for managing data-related logic, such as network calls and local data handling.

- **Components**:
  - **Models**: Define the data structures and manage JSON parsing.
  - **Providers**: Handle network requests and interactions with data services, isolating data logic from the rest of the app.

### Modules Directory (MVC Pattern)

- **Purpose**: Organized by feature, each module follows an MVC (Model-View-Controller) architecture, ensuring clean code separation.

- **Components**:
  - **Controller**: Manages all logical operations for the respective module. For example, handling user actions, coordinating with providers, and updating views.
  - **View**: Responsible for displaying data and adapting visuals based on information processed by the controller.
  - **Binding**: Establishes bindings for controllers, views, and dependencies, enabling efficient dependency injection and simplifying module management.

### Key Features and Current Limitations

This version of Tripee includes core functionalities, such as:

- **Trip Creation**: Users can create new trips with specific details.
- **Reservation System**: Users can make reservations for existing trips.
- **Location Tracking**: Google Maps integration for tracking and displaying trip routes.
- **Messaging Module**: Real-time messaging powered by STOMP for communication between users.

> **Note**: Editing features, such as updating trip information, reservations, or expeditions, are planned for future releases.

## Running the Project

To run the project, follow these steps:

1. **Install Dependencies**: Ensure all necessary dependencies are installed by running:

   ```bash
   flutter pub get
   ```

2. **Configure Backend Connection**: Confirm that the backend server is running on the same network. Check the `identifiants_connections_to_backend.dart` file in the `constants` directory to verify the backend host and port settings.

3. **Build and Run**: Use the following command to start the application:

   ```bash
   flutter run
   ```

4. **Debugging**: If running in debug mode, you may encounter issues with slow network requests. Ensure that both the client and server are on the same local network for optimal performance.

## Commands Overview

| Command                | Description                                  |
| ---------------------- | -------------------------------------------- |
| `git clone <repo-url>` | Clone the project repository                 |
| `cd path/to/project`   | Navigate to the project directory            |
| `flutter pub get`      | Install all Flutter dependencies             |
| `flutter run`          | Build and run the application on your device |

## Upcoming Features

The next release will focus on:

- Enhancements to allow users to update existing trips, reservations, and expeditions.
- Improved user settings and account management.

For questions or issues, please reach out to the development team.
