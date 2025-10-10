<div align="center">

# 🛍️ Laza - Modern E-Commerce Application

[![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev)
[![Clean Architecture](https://img.shields.io/badge/Clean-Architecture-blue?style=for-the-badge)](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)

**A full-featured, modern e-commerce mobile application built with Flutter & Clean Architecture**

[Features](#-features) • [Screenshots](#-screenshots) • [Getting Started](#-getting-started)

</div>

---

## 📱 Screenshots

<div align="center">
<div align="center" style="display: flex; flex-wrap: wrap; justify-content: center; gap: 8px;">
  <img src="https://github.com/user-attachments/assets/ce54ff80-909b-4d92-ab8d-9efe72389258" width="13%" style="border-radius: 10px;" />
  <img src="https://github.com/user-attachments/assets/63374097-4a66-400d-830d-31034265f873" width="13%" style="border-radius: 10px;" />
  <img src="https://github.com/user-attachments/assets/0fd42063-8397-4676-851b-7955540328f9" width="13%" style="border-radius: 10px;" />
  <img src="https://github.com/user-attachments/assets/98d10a20-549c-46b0-b598-dcbff85bda0d" width="13%" style="border-radius: 10px;" />
  <img src="https://github.com/user-attachments/assets/95337d44-6787-44eb-a7b1-63d621e98131" width="13%" style="border-radius: 10px;" />
  <img src="https://github.com/user-attachments/assets/8220da19-4428-426f-87a4-a91bc2494fdc" width="13%" style="border-radius: 10px;" />
  <img src="https://github.com/user-attachments/assets/3e0c1b74-8cd6-426f-9fae-7429f6e53644" width="13%" style="border-radius: 10px;" />

  <br />
  
  <img src="https://github.com/user-attachments/assets/e4d371b0-7eb1-4da1-bd6f-12f6deabb666" width="30%" style="border-radius: 12px; margin-top: 10px;" />
  <img src="https://github.com/user-attachments/assets/01c993ca-a11d-4acd-9419-885033000f7d" width="30%" style="border-radius: 12px; margin-top: 10px;" />
</div>

  
</div>

---

## ✨ Features

### 🔐 Authentication & Security
- **Complete Authentication System**
  - Secure Login with JWT token management
  - User Registration (Sign Up)
  - Email Verification with OTP
  - OTP Resend functionality with timer
  - Password validation with strong security rules
- **Encrypted Storage** using Flutter Secure Storage
- **Session Management** with automatic token refresh
- **Remember Me** functionality
- **Form Validation** for all input fields

### 🛒 Shopping Experience
- **Product Catalog** with grid/list view
- **Product Details** with image gallery
- **Shopping Cart** with quantity management
- **Add to Cart** from product details
- **Size Selection** with size guide
- **Wishlist** functionality (coming soon)
- **Product Categories** with brand filtering
- **Search & Filter** capabilities

### ⭐ Reviews & Ratings
- **Product Reviews** with rating system (1-5 stars)
- **Add Reviews** with star ratings and comments
- **Review Validation** to ensure quality feedback
- **Review History** and pagination
- **Average Rating** display
- **Reviews Count** per product

### 🎨 UI/UX
- **Beautiful Modern Design** with custom themes
- **Smooth Animations** and transitions
- **Hero Animations** for product images
- **Responsive Layout** for different screen sizes
- **Custom Bottom Navigation**
- **Splash Screen** with app branding
- **Toast Messages** for user feedback
- **Loading Indicators** for async operations

### 🔔 Additional Features
- **Cart Management** with real-time updates
- **Order Summary** with VAT calculation
- **Delivery Address** management
- **Payment Methods** integration ready
- **Comprehensive Error Handling** with user-friendly messages
- **Network Error Recovery**
- **Input Validation** across all forms

---

## 🛠️ Tech Stack

### **Frontend**
- **Flutter 3.8.1** - UI Framework
- **Dart** - Programming Language
- **Flutter BLoC (9.1.1)** - State Management
- **Flutter ScreenUtil (5.9.3)** - Responsive Design

### **Backend Integration**
- **Dio (5.9.0)** - HTTP Client
- **Retrofit (4.7.3)** - Type-safe REST Client
- **JSON Serialization (4.9.0)** - Data Parsing
- **Pretty Dio Logger (1.4.0)** - Network Logging

### **Architecture & Patterns**
- **Clean Architecture** - Separation of Concerns
- **Repository Pattern** - Data Layer Abstraction
- **BLoC Pattern** - Business Logic Component
- **Dependency Injection** - GetIt (8.2.0)
- **Mapper Pattern** - Entity-Model conversion

### **Storage**
- **Shared Preferences (2.5.3)** - Local Storage
- **Flutter Secure Storage (9.2.4)** - Encrypted Storage

### **UI Components & Utilities**
- **flutter_svg (2.2.1)** - SVG Rendering
- **flutter_native_splash (2.4.6)** - Splash Screen
- **readmore (3.0.0)** - Text Expansion
- **fluttertoast (9.0.0)** - Toast Messages
- **pin_code_fields (8.0.1)** - OTP Input Fields

### **Development Tools**
- **dartz (0.10.1)** - Functional Programming
- **build_runner (2.9.0)** - Code Generation
- **retrofit_generator (10.0.6)** - API Generation
- **json_serializable (6.11.1)** - JSON Code Generation

---

## 🏗️ Architecture

The project follows **Clean Architecture** principles with three main layers:

```
lib/
├── core/                    # Core functionality
│   ├── common/             # Shared resources
│   │   ├── models/         # Common models (Error model)
│   │   ├── widgets/        # Reusable widgets
│   │   └── form_field_validation.dart  # Form validation
│   ├── constants/          # App constants (colors, assets)
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
│   │       ├── widgets/        # Feature widgets
│   │       └── controllers/    # Form controllers
│
├── di/                     # Dependency Injection
│   └── dependency_injection.dart
│
└── api/                    # API Configuration
    └── api_constant.dart
```

### 📦 Feature Modules

- **🏠 Home** - Product listing and categories
- **🔐 Login** - User authentication
- **📝 Sign Up** - User registration
- **🔢 OTP** - Email verification with OTP
- **📦 Cart** - Shopping cart management
- **📝 Product Details** - Detailed product view
- **⭐ Reviews** - Review system
- **✍️ Add Review** - Review submission
- **📂 Category** - Product categorization
- **🧭 Main** - Bottom navigation & app shell

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
   - Base URL: `https://accessories-eshop.runasp.net/`
   - All endpoints are configured

2. **Authentication**
   - Sign up with email, password, first name, and last name
   - Verify email with OTP code
   - Login with email and password
   - Tokens stored securely using Flutter Secure Storage

---

## 📂 Key Features Implementation

### Authentication Flow

```dart
// Sign Up → OTP Verification → Login
1. User enters registration details
2. Backend sends OTP to email
3. User enters OTP code (6 digits)
4. Email verified successfully
5. User can login with credentials
```

### Form Validation

The app includes comprehensive form validation for:
- **Email**: Validates email format
- **Password**: Requires 8+ characters with upper, lower, special characters, and numbers
- **Name**: Minimum 3 characters
- **OTP**: Exactly 6 digits
- **Description**: Minimum 10 characters for reviews

### State Management (BLoC)

```dart
// Example: Login Cubit
class LoginCubit extends Cubit<LoginState> {
  final LoginRepository _login;
  
  Future<void> login(LoginRequestModel loginModel) async {
    emit(LoadingToLogin());
    try {
      final response = await _login.login(loginModel);
      emit(LoginSuccess(loginResponse: response));
    } on ServerException catch (error) {
      emit(LoginFailure(errors: error.errorModel.getReadableMessage()));
    }
  }
}
```

### Dependency Injection

```dart
final getIt = GetIt.instance;

Future<void> setup() async {
  Dio dio = await DioFactory.getDio();
  
  // Register all features
  _login(dio);
  _signup(dio);
  _otp(dio);
  _home(dio);
  _cart(dio);
  // ... more features
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
- **Weights**: 400 (Regular), 500 (Medium), 600 (SemiBold), 800 (ExtraBold)

---

## 📱 API Integration

### Base URL
```
https://accessories-eshop.runasp.net/
```

### Endpoints

**Authentication**
- `POST /api/auth/register` - User registration
- `POST /api/auth/verify-email` - Email verification
- `POST /api/auth/resend-otp` - Resend OTP
- `POST /api/auth/login` - User login

**Products**
- `GET /api/products` - Get all products
- `GET /api/categories` - Get categories

**Reviews**
- `GET /api/reviews/{productId}` - Get product reviews
- `POST /api/reviews/{userId}` - Add review

**Cart**
- `GET /api/cart` - Get user cart
- `POST /api/cart/items` - Add item to cart

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

## 🔄 Recent Updates

### Version 1.0.0
- ✅ Complete authentication system (Login, Sign Up, OTP)
- ✅ Email verification with OTP
- ✅ Form validation across all screens
- ✅ Shopping cart functionality
- ✅ Product reviews and ratings
- ✅ Toast notifications
- ✅ Error handling improvements
- ✅ UI/UX enhancements

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



<div align="center">

### ⭐ If you like this project, please give it a star on [GitHub](https://github.com/AbdelrahmanAddel/laza)! ⭐

**Made with ❤️ using Flutter**

</div>
