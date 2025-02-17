# Dukaan App

A Flutter e-commerce management application that helps sellers manage their online store.

## Features

- 📱 Complete store management solution
- 🛍️ Order management and tracking
- 💰 Payment processing and analytics
- 📊 Product catalog management
- 🎨 Premium features marketplace

## Libraries Used

### State Management & Navigation
- `get` (GetX) - For state management, dependency injection, and route management

### UI Components
- `flutter/material.dart` - Material Design widgets

## Custom Widgets

### Navigation & App Bar
- `CustomAppBar` - Customized app bar with configurable back button and actions
- `CustomBottomNav` - Bottom navigation bar with 5 main sections
- `CustomDropdown` - Reusable dropdown component with custom styling

### Interactive Components
- `CustomSwitch` - Toggle switch with animation and customizable states
- `CustomReceiptIcon` - Custom painted receipt icon
- `DukaanLogo` - Custom painted Dukaan logo with smile icon

## Screens

### Main Screens
1. `HomeScreen` - Dashboard with store overview
2. `OrderDetailsScreen` - Detailed view of orders
3. `CatalogueScreen` - Product management
4. `ManageStoreScreen` - Store settings and features
5. `PaymentsScreen` - Payment processing and analytics
6. `PremiumScreen` - Premium features marketplace

### Additional Screens
- `SplashScreen` - App loading screen
- `AdditionalInfoScreen` - Extra store information

## Controllers

- `NavigationController` - Manages app navigation and bottom bar state
- `ProductController` - Handles product-related operations
- `StoreController` - Manages store settings and data

## Models

- `OrderModel` - Order data structure
- `ProductModel` - Product data structure
- `StoreModel` - Store configuration and details

## Services

- `ProductService` - Product-related API calls
- `StoreService` - Store-related API operations

## Project Structure

## Design Patterns

- MVC (Model-View-Controller) with GetX
- Dependency Injection using GetX
- Singleton pattern for controllers
- Observer pattern for reactive state management

## UI/UX Features

- Responsive design
- Custom animations
- Material Design guidelines
- Custom painted icons
- Consistent theming
- Interactive components

## Getting Started

1. Clone the repository
2. Run `flutter pub get`
3. Run `flutter run`

## Requirements

- Flutter SDK
- Dart SDK
- Android Studio / VS Code
- Android SDK / Xcode (for iOS)
