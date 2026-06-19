# Changelog - Foodyman POS

All significant features and changes from November 6, 2024 onwards.

## [Latest] - December 24, 2025

### Major Features Added

#### 1. Firebase Cloud Messaging (Push Notifications) ✅
- **Commit**: `807a259a`
- **Description**: Enable push notifications using Firebase Cloud Messaging (FCM)
- **Changes**:
  - Added `firebase_core: ^4.2.1` and `firebase_messaging: ^16.0.4` dependencies
  - Implemented Firebase initialization in `main.dart` for iOS and Android
  - Added background message handler for processing notifications when app is not in foreground
  - Configured Firebase on all platforms: iOS, Android, macOS, Windows
  - Updated native project configurations (Podfile, CMake, etc.)
- **Files Modified**:
  - `pubspec.yaml`, `pubspec.lock`
  - `ios/Podfile.lock`, `macos/Podfile.lock`
  - `windows/runner/windows/generated_plugins.cmake`
  - `android/app/build.gradle`

#### 2. Product Type Filtering (Single/Combo Products) ✅
- **Commit**: `be8ae93b`
- **Date**: December 24, 2025
- **Description**: Added comprehensive single/combo product filtering with UI tabs
- **Features**:
  - Product type parameter added to API calls
  - Separate tabs for Single and Combo products
  - Default view shows Single products
  - Users can switch between product types
  - `ProductTypeTabs` UI component with primary color styling
  - Full pagination support for both product types
  - Type filter integrated into `ProductsList` page
- **Technical Details**:
  - Added `productType` field to `MainState` (default: 'single')
  - Created `setProductType()` method in `MainNotifier`
  - Updated `getProductsPaginate()` to include type parameter
  - Separate API calls for each product type
  - Independent pagination tracking
- **Files Modified**:
  - `lib/src/repository/products_repository.dart`
  - `lib/src/repository/impl/products_repository_impl.dart`
  - `lib/src/presentation/pages/main/riverpod/state/main_state.dart`
  - `lib/src/presentation/pages/main/riverpod/notifier/main_notifier.dart`
  - `lib/src/presentation/pages/main/widgets/products_list.dart`
  - `lib/src/presentation/components/product_type_tabs.dart` (NEW)

#### 3. Physical Keyboard Support for PIN Entry ✅
- **Commit**: `ab085ae7`
- **Description**: Add support for physical keyboard input for PIN/code entry
- **Features**:
  - Hardware keyboard support for numerical input
  - PIN entry without mouse/touchpad
  - Improved accessibility for kitchen staff
  - Physical key mapping for special characters
- **Use Cases**:
  - Kitchen staff can quickly enter codes using physical keyboard
  - Faster PIN verification on desktop devices
  - Better integration with POS hardware

#### 4. Dynamic Theme Colors from Settings ✅
- **Commit**: `12653bfa`
- **Description**: Implement dynamic primary and button font colors
- **Features**:
  - Primary color configurable from settings
  - Button font color adjustable from settings
  - Real-time theme application
  - Settings persistence
  - Application-wide color synchronization
- **Use Cases**:
  - Customize app appearance per restaurant
  - Brand consistency across deployments
  - Theme switching without app restart

### Improvements & Refactoring

#### 1. POS Screen & State Management Refactoring ✅
- **Commit**: `4b57a0ed`
- **Description**: Refactored POS screen, state management, and Freezed models
- **Changes**:
  - Improved state management patterns
  - Enhanced Freezed model generation
  - Better separation of concerns
  - Optimized state mutations

#### 2. Code Quality Enhancement ✅
- **Commit**: `3db457fd`, `a1b88d85`
- **Description**: Enhance code quality and rebrand macOS app
- **Changes**:
  - Updated dependencies to latest versions
  - Code cleanup and optimization
  - Improved naming conventions
  - macOS app rebranding

#### 3. RTL Support & UI Consistency ✅
- **Commit**: `cfe6c735`
- **Description**: Improve RTL (Right-to-Left) support and UI consistency
- **Features**:
  - Better RTL language support (Arabic, Urdu, Persian, etc.)
  - Consistent UI across all screen sizes
  - Improved layout for RTL languages

#### 4. Dependency Updates & Configuration ✅
- **Commit**: `1997a636`
- **Description**: Bumped SDK and Flutter versions
- **Changes**:
  - Updated to latest Flutter SDK
  - Updated Dart SDK version
  - Compatibility improvements
  - Performance optimizations

#### 5. API Endpoint Updates ✅
- **Commit**: `0424c7f3`
- **Description**: Updated API endpoints and Gradle version
- **Changes**:
  - Backend API endpoint migration
  - Gradle version bump for Android
  - SDK configuration updates
  - Improved build stability

#### 6. Maps & Location Improvements ✅
- **Commit**: `db673aad`
- **Description**: Updated dependencies and improved Nominatim usage
- **Changes**:
  - Enhanced OpenStreetMap integration (Nominatim)
  - Improved location services
  - Better map performance
  - Updated location-based features

#### 7. Platform-Specific Improvements ✅
- **Commit**: `173376ee`
- **Description**: Updated API keys and increased iOS deployment target
- **Changes**:
  - Increased iOS minimum deployment target to iOS 13
  - Updated API keys for maps and services
  - Better platform compatibility
  - Improved security configurations

### Bug Fixes

#### Kitchen & Printing Issues
- Fixed printer integration issues
- Fixed printer permission handling
- Improved kitchen display system stability

#### Table Management
- Fixed table management bugs
- Improved table status handling
- Better table-order association

#### Price & Calculations
- Fixed price rate calculations
- Corrected discount application
- Fixed tax calculations

#### UI & Display
- Fixed empty section display
- Fixed Windows-specific UI issues
- Improved layout consistency

### Documentation

#### README Updates ✅
- **Commit**: `813048d2`, `68fdf2f5`
- **Description**: Comprehensive README documentation
- **Content**:
  - Complete feature documentation
  - Architecture and tech stack details
  - Getting started guide
  - Configuration instructions
  - Troubleshooting section
  - Offline order management workflow
  - State management patterns
  - Development guidelines

### Git History Summary

**Total Commits Since November 6, 2024**: ~40 commits

**Commit Distribution**:
- Features: 5 major features
- Refactoring: 7 improvements
- Bug Fixes: 10+ fixes
- Documentation: 3 updates
- Chores/Updates: 15+ maintenance commits

## Feature Timeline

```
November 2024
├── Printer fixes
├── Table management improvements
└── Price calculation fixes

December 2024
├── RTL support improvements
├── API endpoint updates
├── SDK and Flutter version bumps
├── Maps integration improvements
├── Dynamic theme colors
├── Physical keyboard support for PIN
├── Firebase Cloud Messaging integration
├── Product type filtering (Single/Combo)
└── Comprehensive documentation

Latest (December 24, 2025)
└── Firebase Messaging enabled
```

## Breaking Changes

None reported in this release cycle.

## Known Issues

None reported at this time. All previous issues have been resolved.

## Testing Coverage

All features have been tested on:
- macOS (primary development target)
- Android
- iOS
- Windows (compatibility improvements)

## Next Steps / Planned Features

- Advanced order analytics
- Enhanced reporting dashboard
- Mobile app synchronization
- Advanced inventory management
- Multi-location management

## Contributors

Developed by the Foodyman team

---

**Last Updated**: December 24, 2025
