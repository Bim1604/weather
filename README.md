# 🌤 Weather App (Flutter + GetX)

A simple weather application using **Flutter**, **GetX** for state management, and **OpenWeatherMap API** to fetch real-time weather data. The app will display:

- Current temperature and location name based on the user's location
- Average temperature forecast for the next **4 days**

---

## 📱 User Interface

- **Main Screen**: Shows the current temperature and current location & forecast
- **Error Screen**: Displays an error message and a `Retry` button
- **Loading State**: Shows a loading screen while fetching data

---

## 🏗️ Architecture & Technologies

| Component        | Description                                                            |
|------------------|------------------------------------------------------------------------|
| `GetX`           | State management (`HomeController`), routing, and binding              |
| `OpenWeatherMap` | Free weather API (5 day / 3 hour forecast, geocoding, current weather) |
| `Flutter`        | Native UI for Android & iOS                                            |
| `Dart`           | Main language for business logic                                       |
| `flutter_test`   | For writing unit and widget tests                                      |

**Overall Architecture**: The app follows **MVC** (Model-View-Controller) architecture:
- **Model**: Represents the data (weather data, forecasts, etc.).
- **View**: The UI that displays data to the user (e.g., `HomeView`).
- **Controller**: Contains the logic for fetching data and updating the view (e.g., `HomeController`).

---

## 🧪 Testing

- **Test coverage**: At least 80%
- **Unit Tests**:
    - Logic for calculating daily average temperatures
    - Error handling and state management
- **Widget Tests**:
    - Loading, success, and error states
    - Verifying Retry button functionality

## ⚙️ Setup

git clone https://github.com/Bim1604/weather.git
flutter pub get
flutter run

## 🔐 API Key Configuration

Register at https://openweathermap.org/api
Add your apiKey in lib/datas/app_key.dart:
static const String apiKey = "YOUR_API_KEY";

## 📦 Supported SDKs
Android: SDK 24 and above
iOS: iOS 12 and above
Flutter: Stable channel


