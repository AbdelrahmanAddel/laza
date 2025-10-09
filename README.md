<div align="center">

# 🛍️ Laza - Modern E-Commerce Application

[![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev)
[![Clean Architecture](https://img.shields.io/badge/Clean-Architecture-blue?style=for-the-badge)](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)

**A full-featured, modern e-commerce mobile application built with Flutter & Clean Architecture**

[Features](#-features) • [Screenshots](#-screenshots) • [Tech Stack](#-tech-stack) • [Architecture](#-architecture) • [Getting Started](#-getting-started)

</div>

---

## 📱 Screenshots

<div align="center">
  <img src="https://github.com/user-attachments/assets/ce54ff80-909b-4d92-ab8d-9efe72389258" width="11%" style="margin: 2px;" />
  <img src="https://github.com/user-attachments/assets/63374097-4a66-400d-830d-31034265f873" width="11%" style="margin: 2px;" />
  <img src="https://github.com/user-attachments/assets/0fd42063-8397-4676-851b-7955540328f9" width="11%" style="margin: 2px;" />
  <img src="https://github.com/user-attachments/assets/98d10a20-549c-46b0-b598-dcbff85bda0d" width="11%" style="margin: 2px;" />
  <img src="https://github.com/user-attachments/assets/95337d44-6787-44eb-a7b1-63d621e98131" width="11%" style="margin: 2px;" />
  <img src="https://github.com/user-attachments/assets/8220da19-4428-426f-87a4-a91bc2494fdc" width="11%" style="margin: 2px;" />
  <img src="https://github.com/user-attachments/assets/3e0c1b74-8cd6-426f-9fae-7429f6e53644" width="11%" style="margin: 2px;" />
</div>

---

## ✨ Features

### 🔐 Authentication & Security
- **Secure Login System** with JWT token management
- **Encrypted Storage** using Flutter Secure Storage
- **Session Management** with automatic token refresh
- **Remember Me** functionality

### 🛒 Shopping Experience
- **Product Catalog** with grid/list view
- **Product Details** with image gallery
- **Shopping Cart** with quantity management
- **Size Selection** with size guide
- **Wishlist** functionality
- **Product Categories** with brand filtering
- **Search & Filter** capabilities

### ⭐ Reviews & Ratings
- **Product Reviews** with rating system
- **Add Reviews** with star ratings
- **Review History** and pagination
- **Average Rating** display

### 🎨 UI/UX
- **Beautiful Modern Design** with custom themes
- **Smooth Animations** and transitions
- **Hero Animations** for product images
- **Responsive Layout** for different screen sizes
- **Custom Bottom Navigation**
- **Splash Screen** with app branding

### 🔔 Additional Features
- **Cart Management** with real-time updates
- **Order Summary** with VAT calculation
- **Delivery Address** management
- **Payment Methods** integration ready
- **Error Handling** with user-friendly messages

---

## 🛠️ Tech Stack

### **Frontend**
- **Flutter 3.8.1** - UI Framework
- **Dart** - Programming Language
- **Flutter BLoC** - State Management
- **Flutter ScreenUtil** - Responsive Design

### **Backend Integration**
- **Dio** - HTTP Client
- **Retrofit** - Type-safe REST Client
- **JSON Serialization** - Data Parsing

### **Architecture & Patterns**
- **Clean Architecture** - Separation of Concerns
- **Repository Pattern** - Data Layer Abstraction
- **BLoC Pattern** - Business Logic Component
- **Dependency Injection** - GetIt

### **Storage**
- **Shared Preferences** - Local Storage
- **Flutter Secure Storage** - Encrypted Storage

### **Additional Libraries**
- **flutter_svg** - SVG Rendering
- **dartz** - Functional Programming
- **pretty_dio_logger** - Network Logging
- **readmore** - Text Expansion

---

## 🏗️ Architecture

The project follows **Clean Architecture** principles with three main layers:

```
lib/
├── core/                    # Core functionality
│   ├── common/             # Shared resources
│   │   ├── models/         # Common models
│   │   └── widgets/        # Reusable widgets
│   ├── constants/          # App constants
│   ├── errors/             # Error handling
│   └── helper/             # Utility functions
│
├── features/               # Feature modules
│   ├── [feature_name]/
│   │   ├── data/
│   │   │   ├── datasources/    # API services
│   │   │   ├── models/         # Data models
│   │   │   ├── mapper/         # Entity mappers
│   │   │   └── repositories/   # Repository implementations
│   │   ├── domain/
│   │   │   ├── entities/       # Business entities
│   │   │   └── repositories/   # Repository interfaces
│   │   └── presentation/
│   │       ├── cubit/          # State management
│   │       ├── screens/        # UI screens
│   │       └── widgets/        # Feature widgets
│
└── di/                     # Dependency Injection
    └── dependency_injection.dart
```

### 📦 Feature Modules

- **🏠 Home** - Product listing and categories
- **🔐 Login** - Authentication
- **📦 Cart** - Shopping cart management
- **📝 Product Details** - Detailed product view
- **⭐ Reviews** - Review system
- **✍️ Add Review** - Review submission
- **📂 Category** - Product categorization
- **🧭 Main** - Bottom navigation

---

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.8.1 or higher)
- Dart SDK
- Android Studio / VS Code
- iOS Simulator / Android Emulator

### Installation

1. **Clone the repository**
```bash
git clone https://github.com/AbdelrahmanAddel/laza.git
cd laza
```

2. **Install dependencies**
```bash
flutter pub get
```

3. **Generate code**
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

4. **Run the app**
```bash
flutter run
```

### Configuration

1. **API Configuration** (`lib/api/api_constant.dart`)
   - The app uses: `https://accessories-eshop.runasp.net/`
   - Update endpoints if needed

2. **Authentication**
   - Default login credentials are configured in the app
   - Tokens are stored securely using Flutter Secure Storage

---

## 📂 Project Structure Details

### State Management (BLoC)

Each feature uses BLoC for state management:

```dart
// Example: Home Cubit
class HomeCubit extends Cubit<HomeState> {
  final HomeRepository homeRepository;
  
  Future<void> getProducts() async {
    emit(LoadingToLoadHomeProduct());
    try {
      final products = await homeRepository.getProducts();
      emit(HomeProductsLoaded(products: products));
    } catch (e) {
      emit(ErrorToLoadHomeProduct(message: e.toString()));
    }
  }
}
```

### Dependency Injection

Using **GetIt** for dependency injection:

```dart
final getIt = GetIt.instance;

Future<void> setup() async {
  // Register services, repositories, and cubits
  getIt.registerLazySingleton<HomeApiService>(() => HomeApiService(dio));
  getIt.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(getIt()));
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt()));
}
```

---

## 🎨 Design System

### Color Palette
- **Primary**: `#9775FA` (Purple)
- **Secondary**: `#FF7043` (Orange)
- **Text**: `#1D1E20` (Dark)
- **Grey**: `#8F959E`
- **Light Grey**: `#F5F6FA`

### Typography
- **Font Family**: Inter
- **Weights**: 400, 500, 600, 800

---

## 📱 API Integration

### Base URL
```
https://accessories-eshop.runasp.net/
```

### Endpoints
- `POST /api/auth/login` - User login
- `GET /api/products` - Get products
- `GET /api/categories` - Get categories
- `GET /api/reviews/{productId}` - Get reviews
- `POST /api/reviews/{userId}` - Add review
- `GET /api/cart` - Get cart
- `POST /api/cart/items` - Add to cart

---

## 🧪 Testing

```bash
# Run tests
flutter test

# Run with coverage
flutter test --coverage
```

---

## 📦 Build & Release

### Android
```bash
flutter build apk --release
flutter build appbundle --release
```

### iOS
```bash
flutter build ios --release
```

---

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

---

## 👨‍💻 Developer

<div align="center">

### Abdelrahman Adel Ezzeldean

[![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/abdelrahman-ezzeldean/)
[![GitHub](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/AbdelrahmanAddel)
[![Email](https://img.shields.io/badge/Email-D14836?style=for-the-badge&logo=gmail&logoColor=white)](mailto:abdelrahmanezzeldean@gmail.com)

**Flutter Developer | Mobile App Enthusiast**

</div>

---

## 📞 Contact

For any inquiries or support:

- **LinkedIn**: [Abdelrahman Ezzeldean](https://www.linkedin.com/in/abdelrahman-ezzeldean/)
- **GitHub**: [@AbdelrahmanAddel](https://github.com/AbdelrahmanAddel)
- **Email**: abdelrahmanezzeldean@gmail.com
- **Project Repository**: [Laza E-Commerce](https://github.com/AbdelrahmanAddel/laza)

---

## 🙏 Acknowledgments

- Flutter Team for the amazing framework
- The open-source community for incredible packages
- All contributors who help improve this project

---

<div align="center">

### ⭐ If you like this project, please give it a star on [GitHub](https://github.com/AbdelrahmanAddel/laza)! ⭐

**Made with ❤️ using Flutter**

</div>
