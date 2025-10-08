# Cat Grooming Business Forms App - Activity 5

[![Flutter](https://img.shields.io/badge/Flutter-3.0%2B-02569B?logo=flutter)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.0%2B-0175C2?logo=dart)](https://dart.dev)
[![Provider](https://img.shields.io/badge/State%20Management-Provider-orange)](https://pub.dev/packages/provider)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

> A comprehensive Flutter application demonstrating advanced state management with Provider, multimedia integration, and custom UI components for a Cat Grooming business.

---

## Table of Contents

- [Features](#features)
- [Activity Requirements](#activity-requirements)
- [Installation](#installation)
- [Usage](#usage)
- [File Structure](#file-structure)
- [State Management](#state-management)
- [Media & Assets](#media--assets)
- [Configuration](#configuration)
- [API Reference](#api-reference)
- [License](#license)
- [Acknowledgments](#acknowledgments)

---

## Features

### 🛒 State Management with Provider
- **Shopping Cart System** - Add, remove, and manage grooming products with real-time cart updates
- **Todo List Manager** - Full CRUD operations (Create, Read, Update, Delete) for task management
- **Theme Switcher** - Seamless dark/light mode toggle affecting the entire application
- **ChangeNotifier Pattern** - Reactive UI updates using Provider's ChangeNotifier
- **Context Methods** - Demonstrates proper usage of `context.read()` vs `context.watch()`

### 🎨 Media & Assets Integration
- **Local Image Display** - Asset-based images with `Image.asset()`
- **Network Image Loading** - Dynamic image fetching from TheCatAPI using `Image.network()`
- **Image Styling** - Circular borders, BoxDecoration, and custom layouts
- **GridView Gallery** - Responsive 2x2 grid displaying local cat images
- **Image Carousel** - PageView-based carousel with navigation controls and indicators

### 🎥 Multimedia Players
- **Video Player** - Full-featured video playback using `video_player` package
- **Enhanced Controls** - Professional video controls via `chewie` package (play, pause, fullscreen)
- **Audio Player** - Audio playback with play, pause, and stop controls using `audioplayers`
- **Combined Media Page** - Unified interface for both video and audio playback

### 🎨 Custom UI Components
- **Dynamic Icons** - Material Icons with runtime size (20-150px) and color adjustments
- **Custom Icon Sets** - Integration of `flutter_vector_icons` (MaterialCommunityIcons, FontAwesome)
- **Custom Fonts** - Poppins and Roboto fonts declared in `pubspec.yaml`
- **Profile Card** - Elegant card component with image, custom icons, and styled text
- **Responsive Layouts** - Adaptive UI components for various screen sizes

### 🧭 Navigation & UX
- **Drawer Navigation** - Comprehensive side menu accessing all features
- **Bottom Navigation** - Quick access to Home, About, and Contact pages
- **Tab Navigation** - DefaultTabController with Chats, Status, and Calls tabs
- **Route Management** - Named routes for clean navigation architecture

---

## Activity Requirements

This project fulfills **Activity 5: State Management & Media Assets** requirements:

### State Management (Provider)
1. ✅ **Shopping Cart App** - `lib/pages/shop_page.dart` & `lib/pages/cart_page.dart`
2. ✅ **ChangeNotifier Implementation** - `lib/providers/cart_provider.dart`, `lib/providers/todo_provider.dart`, `lib/theme_provider.dart`
3. ✅ **context.read() vs context.watch()** - Demonstrated in `lib/pages/provider_demo_page.dart` and throughout the app
4. ✅ **Theme Switcher** - `lib/pages/theme_switch_page.dart` with dark/light mode toggle
5. ✅ **Todo List App** - `lib/pages/todo_page.dart` with full CRUD operations

### Images
6. ✅ **Local Image (Image.asset)** - `lib/pages/media_gallery_page.dart`, `lib/pages/carousel_page.dart`
7. ✅ **Network Image (Image.network)** - `lib/pages/media_gallery_page.dart` with TheCatAPI integration
8. ✅ **Circular Border (BoxDecoration)** - `lib/pages/media_gallery_page.dart` (4px teal border)
9. ✅ **GridView with Assets** - `lib/pages/media_gallery_page.dart` (2x2 grid layout)

### Video & Audio
10. ✅ **Video Player** - `lib/pages/media_player_page.dart` using `video_player` package
11. ✅ **Chewie Controls** - Enhanced video player with play, pause, fullscreen controls
12. ✅ **Audio Player** - `lib/pages/media_player_page.dart` with play, pause, stop buttons

### Icons & Fonts
13. ✅ **Dynamic Material Icons** - `lib/pages/icon_demo_page.dart` with size/color sliders
14. ✅ **Custom Icon Set** - `flutter_vector_icons` package with MaterialCommunityIcons and FontAwesome
15. ✅ **Custom Fonts** - Poppins and Roboto declared in `pubspec.yaml`
16. ✅ **Two Font Styles** - Demonstrated in `lib/pages/profile_card.dart` and `lib/pages/carousel_page.dart`

### Combined Features
17. ✅ **Profile Card** - `lib/pages/profile_card.dart` with image, icon, and styled text
18. ✅ **Gallery/Carousel** - `lib/pages/media_gallery_page.dart` and `lib/pages/carousel_page.dart`
19. ✅ **Video + Audio Player** - `lib/pages/media_player_page.dart` with all controls

---

## Installation

### Prerequisites

Before you begin, ensure you have the following installed:

- **Flutter SDK**: Version 3.0.0 or higher
  - Download from [flutter.dev](https://flutter.dev/docs/get-started/install)
- **Dart SDK**: Version 3.0.0 or higher (included with Flutter)
- **IDE**: Android Studio, VS Code, or IntelliJ IDEA with Flutter plugins
- **Git**: For cloning the repository
- **Device/Emulator**: Android device/emulator or iOS simulator

### Step-by-Step Installation

1. **Clone the Repository**

```bash
git clone https://github.com/yourusername/cat-grooming-app.git
cd cat-grooming-app
```

2. **Install Dependencies**

```bash
flutter pub get
```

This command downloads all required packages specified in `pubspec.yaml`:
- `provider: ^6.1.2`
- `video_player: ^2.9.2`
- `chewie: ^1.7.5`
- `audioplayers: ^6.0.0`
- `flutter_vector_icons: ^2.0.0`
- `http: ^1.1.0`

3. **Verify Installation**

```bash
flutter doctor
```

Ensure all checks pass. Fix any issues reported by Flutter Doctor.

4. **Run the Application**

```bash
# For Android 
flutter run

# For iOS (macOS only)
flutter run -d ios

# For Web
flutter run -d chrome

# For specific device
flutter devices  # List available devices
flutter run -d <device-id>
```

### Alternative Installation Methods

**Using FlutLab.io (Online IDE)**

1. Visit [flutlab.io](https://flutlab.io)
2. Import the project from GitHub
3. Click "Run" to build and test

**Using GitHub Codespaces**

1. Click "Code" → "Codespaces" → "Create codespace on main"
2. Wait for environment setup
3. Run `flutter pub get` in terminal
4. Execute `flutter run -d web-server`

---

## Usage

### Running the App

After installation, launch the app on your preferred device:

```bash
flutter run
```

### Navigating the Application

1. **Login Screen** - Initial entry point (placeholder for authentication)
2. **Main Navigation** - Access via drawer menu (hamburger icon) or bottom navigation
3. **Feature Access** - All 19 activity requirements accessible from the drawer menu

### Key Features Walkthrough

#### Shopping Cart
```dart
// Navigate: Drawer → Shop
// Actions:
// - Tap "Add" button on products
// - View cart counter in AppBar
// - Tap FAB (Floating Action Button) to view cart
// - Remove items or checkout
```

#### Todo List
```dart
// Navigate: Drawer → Todo List
// Actions:
// - Enter todo text in TextField
// - Tap "Add" button or press Enter
// - Check/uncheck to toggle completion
// - Tap edit icon to modify todo
// - Tap delete icon to remove todo
// - Use "Clear Completed" or "Clear All" buttons
```

#### Theme Switcher
```dart
// Navigate: Drawer → Dark Mode Toggle (at bottom)
// OR: AppBar → Light/Dark mode icon
// Effect: Entire app switches between light and dark themes
```

#### Media Gallery
```dart
// Navigate: Drawer → Media Gallery
// Features:
// - Local images with circular teal borders (top section)
// - Network images from TheCatAPI (bottom section)
// - GridView layout (2x2)
```

#### Image Carousel
```dart
// Navigate: Drawer → Image Carousel
// Controls:
// - Swipe left/right to navigate
// - Tap "Previous" or "Next" buttons
// - View page indicators (dots)
// - See image captions with custom fonts
```

#### Media Player
```dart
// Navigate: Drawer → Media Player Demo
// Video Controls (Chewie):
// - Play/Pause toggle
// - Seek bar
// - Fullscreen button
// - Volume control
// Audio Controls:
// - Play button (starts audio)
// - Pause button (pauses audio)
// - Stop button (stops and resets audio)
```

#### Dynamic Icon Demo
```dart
// Navigate: Drawer → Dynamic Icon Demo
// Interactions:
// - Drag size slider (20-150px)
// - Tap color circles to change icon color
// - Tap icon cards to select different icons
// - Includes Material Icons and custom vector icons
```

#### Profile Card
```dart
// Navigate: Drawer → Profile Card
// Displays:
// - Circular avatar with cat image
// - "Fluffy the Cat" (Poppins font)
// - Star icon (amber color)
// - "Premium Member" (Roboto font)
```

---

## File Structure

```
cat-grooming-app/
├── android/                  # Android-specific files
├── ios/                      # iOS-specific files
├── lib/                      # Main application code
│   ├── main.dart            # App entry point, route configuration
│   ├── theme_provider.dart  # Theme state management
│   ├── providers/           # State management providers
│   │   ├── cart_provider.dart      # Shopping cart logic
│   │   ├── todo_provider.dart      # Todo list logic
│   │   └── theme_provider.dart     # (Neutralized duplicate)
│   ├── pages/               # UI screens
│   │   ├── about_page.dart
│   │   ├── cart_page.dart          # Shopping cart display
│   │   ├── carousel_page.dart      # Image carousel with PageView
│   │   ├── contact_page.dart
│   │   ├── home_page.dart
│   │   ├── icon_demo_page.dart     # Dynamic icon demonstration
│   │   ├── login_screen.dart
│   │   ├── media_gallery_page.dart # Image gallery (local + network)
│   │   ├── media_player_page.dart  # Video + Audio player
│   │   ├── navigation_wrapper.dart # Main navigation structure
│   │   ├── profile_card.dart       # Profile card component
│   │   ├── provider_demo_page.dart # context.read() vs watch() demo
│   │   ├── shop_page.dart          # Product listing
│   │   ├── theme_switch_page.dart  # Theme toggle page
│   │   └── todo_page.dart          # Todo list with CRUD
│   └── widgets/             # Reusable UI components
│       ├── controller_form.dart
│       ├── date_time_form.dart
│       ├── dropdown_form.dart
│       ├── list_saving_form.dart
│       ├── login_form.dart
│       ├── media_player.dart
│       ├── multi_input_form.dart
│       ├── product_item.dart
│       ├── registration_form.dart
│       └── username_form.dart
├── assets/                  # Static resources
│   ├── images/             # Local images
│   │   ├── cat1.jpg        # 764 KB
│   │   ├── cat2.jpg        # 24 KB
│   │   ├── cat3.jpg        # 207 KB
│   │   └── cat4.jpg        # 2.8 MB
│   ├── videos/             # Video files
│   │   └── cat_vid.mp4     # 11 MB
│   ├── audio/              # Audio files
│   │   └── cat.mp3         # 28 KB
│   └── fonts/              # Custom fonts
│       ├── Poppins-Regular.ttf
│       └── Roboto-Regular.ttf
├── test/                    # Unit and widget tests
├── pubspec.yaml            # Dependencies and assets configuration
├── README.md               # This file
├── report.txt              # Implementation documentation
├── BUILD_FIX_SUMMARY.txt   # Build error resolution log
└── FINAL_QA_AUDIT.txt      # Comprehensive QA audit report
```

---

## State Management

### Provider Architecture

This application uses the **Provider** package for state management, following the recommended Flutter architecture patterns.

#### Providers Overview

| Provider | Purpose | Location | Key Methods |
|----------|---------|----------|-------------|
| **CartProvider** | Manages shopping cart state | `lib/providers/cart_provider.dart` | `addItem()`, `removeItem()`, `clearCart()` |
| **TodoProvider** | Manages todo list state | `lib/providers/todo_provider.dart` | `addTodo()`, `toggleTodo()`, `updateTodo()`, `removeTodo()` |
| **ThemeProvider** | Manages app theme state | `lib/theme_provider.dart` | `toggleTheme()`, `isDarkMode` |

#### ChangeNotifier Pattern

All providers extend `ChangeNotifier` and call `notifyListeners()` when state changes:

```dart
class CartProvider extends ChangeNotifier {
  final List<String> _cartItems = [];

  void addItem(String item) {
    _cartItems.add(item);
    notifyListeners(); // Triggers UI rebuild
  }
}
```

#### Context Methods

**context.watch()** - Listens for changes and rebuilds widget:
```dart
final cart = context.watch<CartProvider>();
// Widget rebuilds when cart changes
```

**context.read()** - One-time access without listening:
```dart
context.read<CartProvider>().addItem(product);
// Executes action without rebuilding current widget
```

#### Provider Registration

All providers are registered in `main.dart`:

```dart
MultiProvider(
  providers: [
    ChangeNotifierProvider(create: (_) => CartProvider()),
    ChangeNotifierProvider(create: (_) => ThemeProvider()),
    ChangeNotifierProvider(create: (_) => TodoProvider()),
  ],
  child: const BusinessFormsApp(),
)
```

---

## Media & Assets

### Images

**Local Images** (stored in `assets/images/`):
- `cat1.jpg` - Fluffy Persian Cat (764 KB)
- `cat2.jpg` - Adorable Kitten (24 KB)
- `cat3.jpg` - Majestic Cat Portrait (207 KB)
- `cat4.jpg` - Playful Feline (2.8 MB)

**Network Images**:
- Fetched from [TheCatAPI](https://thecatapi.com/)
- API endpoint: `https://api.thecatapi.com/v1/images/search?limit=8`
- No API key required for basic usage

### Video

**File**: `assets/videos/cat_vid.mp4`
- Size: 11 MB
- Format: MP4
- Playback: `video_player` package with `chewie` controls

### Audio

**File**: `assets/audio/cat.mp3`
- Size: 28 KB
- Format: MP3
- Playback: `audioplayers` package

### Fonts

**Poppins** - Used for headers and titles
- File: `assets/fonts/Poppins-Regular.ttf`
- Weight: Regular (400)

**Roboto** - Used for body text and subtitles
- File: `assets/fonts/Roboto-Regular.ttf`
- Weight: Regular (400)

### Asset Configuration

All assets are declared in `pubspec.yaml`:

```yaml
flutter:
  assets:
    - assets/images/
    - assets/videos/
    - assets/audio/

  fonts:
    - family: Poppins
      fonts:
        - asset: assets/fonts/Poppins-Regular.ttf
    - family: Roboto
      fonts:
        - asset: assets/fonts/Roboto-Regular.ttf
```

---

## Configuration

### Environment Variables

This application does not require environment variables for basic functionality. However, if you want to use TheCatAPI with authentication:

1. Create a `.env` file in the project root:
```env
CAT_API_KEY=your_api_key_here
```

2. Install `flutter_dotenv` package:
```bash
flutter pub add flutter_dotenv
```

3. Load in `main.dart`:
```dart
await dotenv.load(fileName: ".env");
```

### App Configuration

**Theme Configuration** (`lib/main.dart`):
```dart
theme: ThemeData(
  primarySwatch: Colors.teal,
  brightness: Brightness.light,
  useMaterial3: true,
),
darkTheme: ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(primary: Colors.teal),
),
```

**Navigation Configuration** (`lib/main.dart`):
```dart
routes: {
  '/': (context) => const LoginScreen(),
  '/home': (context) => const NavigationWrapper(),
  '/media': (context) => const MediaGalleryPage(),
  '/player': (context) => const MediaPlayerPage(),
  '/todo': (context) => const TodoPage(),
  '/carousel': (context) => const CarouselPage(),
  '/iconDemo': (context) => const IconDemoPage(),
  '/profile': (context) => Scaffold(...),
}
```

---

## API Reference

### CartProvider

```dart
class CartProvider extends ChangeNotifier {
  List<String> get cartItems;        // Get all cart items
  int get count;                      // Get total item count
  
  void addItem(String item);          // Add item to cart
  void removeItem(String item);       // Remove item from cart
  void clearCart();                   // Clear all items
}
```

### TodoProvider

```dart
class TodoProvider extends ChangeNotifier {
  List<TodoItem> get todos;           // Get all todos
  int get count;                      // Get total todo count
  int get completedCount;             // Get completed todo count
  
  void addTodo(String title);         // Add new todo
  void toggleTodo(String id);         // Toggle completion status
  void updateTodo(String id, String newTitle); // Update todo title
  void removeTodo(String id);         // Delete todo
  void clearCompleted();              // Remove completed todos
  void clearAll();                    // Remove all todos
}
```

### ThemeProvider

```dart
class ThemeProvider extends ChangeNotifier {
  ThemeMode get currentTheme;         // Get current theme mode
  bool get isDarkMode;                // Check if dark mode is active
  
  void toggleTheme();                 // Switch between light/dark mode
}
```

---

## License

Distributed under the MIT License. See [LICENSE](LICENSE) for more information.

```
MIT License

Copyright (c) 2025 Cat Grooming App Contributors

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

---

## Acknowledgments

### Dependencies

This project uses the following open-source packages:

- **[provider](https://pub.dev/packages/provider)** (^6.1.2) - State management solution
- **[video_player](https://pub.dev/packages/video_player)** (^2.9.2) - Video playback functionality
- **[chewie](https://pub.dev/packages/chewie)** (^1.7.5) - Enhanced video player controls
- **[audioplayers](https://pub.dev/packages/audioplayers)** (^6.0.0) - Audio playback functionality
- **[flutter_vector_icons](https://pub.dev/packages/flutter_vector_icons)** (^2.0.0) - Custom icon sets
- **[http](https://pub.dev/packages/http)** (^1.1.0) - HTTP requests for network images

### Resources

- **[TheCatAPI](https://thecatapi.com/)** - Cat images for demonstration
- **[Flutter Documentation](https://flutter.dev/docs)** - Official Flutter guides
- **[Provider Documentation](https://pub.dev/documentation/provider/latest/)** - State management patterns
- **[Material Design](https://material.io/)** - UI/UX design guidelines

### Useful Commands

```bash
# Check Flutter installation
flutter doctor

# Get dependencies
flutter pub get

# Run the app
flutter run

# Run tests
flutter test

# Analyze code
flutter analyze

# Format code
flutter format .

# Build APK (Android)
flutter build apk

# Build iOS (macOS only)
flutter build ios

# Clean build files
flutter clean
```

---

<div align="center">

**[⬆ Back to Top](#cat-grooming-business-forms-app---activity-5)**

</div>