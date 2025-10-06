# Flutter Navigation Activity (Activity 4)

## Overview

This Flutter project demonstrates multiple navigation paradigms essential for modern app development. It builds upon Activity 3 by integrating:

- Stack navigation  
- Drawer menus  
- BottomNavigationBar with icons  
- TabBar with TabBarView  
- Named routes  

All combined into a seamless user experience. The project emphasizes proper navigation flow, back stack management, and intuitive UI/UX.

---

## Features Implemented

### 1. Stack Navigation (`Navigator.push` & `Navigator.pop`)
- From the Login screen, pushes to Home screen upon login.
- Logout pops back from Home screen to Login screen.
- Demonstrates the difference between:
  - `push()` → keeps previous screen in stack  
  - `pushReplacement()` → removes previous screen from stack

### 2. Drawer Menu Navigation
- Home screen contains a Drawer with navigation to:
  - Home  
  - Profile  
  - About  
  - Contact  
- Home in Drawer **does not push a new route**, keeping BottomNavigationBar visible.

### 3. BottomNavigationBar
- Three tabs: Home, Profile, and Settings  
- Each tab has an icon and dynamically switches content without reloading the page.

### 4. TabBar and TabBarView
- TabBar integrated inside the AppBar with tabs: Chats, Status, Calls  
- TabBarView allows swiping or tapping to switch content inside the Home screen.

### 5. Combination of Drawer and BottomNavigationBar
- Both exist simultaneously on the Home screen for flexible navigation options.  
- Drawer navigation updates `_selectedIndex` when Home/Profile/Settings is tapped, keeping BottomNavigationBar synchronized.

### 6. Named Routes
- Routes defined for:
  - Login (`/`)  
  - Home (`/home`)  
  - About (`/about`)  
  - Contact (`/contact`)  
- Navigation uses named routes for cleaner, maintainable code.

### 7. Integrated Navigation Flow
- App launches at Login screen.  
- Successful login navigates to Home using `pushReplacement` (prevents stacking multiple homes).  
- Home screen includes Drawer, BottomNavigationBar, and TabBar.  
- Logout clears navigation stack using `pushNamedAndRemoveUntil`.

### 8. UI/UX Highlights
- Material Design Cards and safe layout for visual clarity.  
- User feedback via SnackBars for login, logout, and navigation events.  
- Consistent icons in Drawer, BottomNavigationBar, and TabBar.  
- Responsive design for different device sizes.  
- Use of `const` constructors for optimized build performance.

---

## How to Demo Physically

1. **Login Flow**  
   - Launch app → Login screen appears.  
   - Enter credentials → Tap Login.  
   - Demonstrates `pushReplacement`: back button exits app instead of returning to Login.

2. **Drawer Navigation**  
   - Open Drawer → Home, Profile, About, Contact.  
   - Tap Home → stays on Home (BottomNavigationBar visible).  
   - Tap About/Contact → navigates to page (Back button returns to Home).

3. **BottomNavigationBar Tabs**  
   - Switch between Home, Profile, and Settings tabs.  
   - Observe icons and dynamic content updates.

4. **TabBar**  
   - Inside AppBar, swipe or tap between Chats, Status, Calls tabs.  
   - Shows independent tabbed content inside Home.

5. **Logout Flow**  
   - Tap Logout → instantly returns to Login using `pushNamedAndRemoveUntil`.  
   - Demonstrates clearing navigation stack.

---

## Setup and Run Instructions

```bash
# Clone the repository
git clone <repository-url>

# Navigate to the project folder
cd flutter_navigation_activity

# Get dependencies
flutter pub get

# Run the app
flutter run
