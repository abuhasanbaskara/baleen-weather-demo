# Flutter Weather App

*English follows Japanese / 英語は日本語の後に続きます*

## 日本語版

### プロジェクト概要
このプロジェクトはFlutterで開発された天気予報アプリケーションです。Clean Architectureの簡略版を採用し、開発・保守・スケーラビリティを重視した設計になっています。

### システム要件
- **Flutter Version**: 3.32.1 (stable channel)
- **開発環境**: Android Studio / Xcode / Visual Studio Code

### セットアップ手順

#### 1. Flavors設定
このプロジェクトは手動でFlavorsを設定します。これにより、base URL、アプリの外観、staging/production環境を区別できます。

**Android Studio での設定:**
1. Launcher tab → Edit Configurations
2. Add New Configuration (+) をクリック
3. Dart Entrypoint に `main_staging.dart` または `main_production.dart` を入力
4. Build flavor名を入力（例：staging, production）
5. Apply → OK

**Xcode での設定:**
1. TARGETS (RUNNER) → Build Settings
2. FLUTTER_TARGET を `lib/main.dart` から `lib/main_staging.dart` または `lib/main_production.dart` に変更

**コマンドライン実行（オプション）:**
```bash
flutter run --flavor staging -t lib/main_staging.dart
flutter run --flavor production -t lib/main_production.dart
```

#### 2. Native Splash Screen
ネイティブのスプラッシュスクリーンを使用して、Android/iOSの自然な起動体験を提供します。

```bash
flutter pub run flutter_native_splash:create
```

#### 3. 多言語対応（Localization）
アプリの初回起動時に言語設定を保存し、多言語対応を実現します。

```bash
flutter gen-l10n
```

**注意**: エラーが発生した場合は、キャッシュの問題である可能性があります。Android Studioを再起動してください。

#### 4. Hive データベース
ローカルデータベースとしてHiveを使用します。インターネット接続がない場合でも天気情報を閲覧できます。

```bash
dart run build_runner build
```

#### 5. iOS 追加設定
iOSでアプリを起動する前に、podの再インストールが必要な場合があります。

```bash
cd ios
pod deintegrate
pod install
```

### アーキテクチャ

**Simplified Clean Architecture** を採用し、開発効率と理解しやすさを重視しています。

```
lib/
├── data/             # モデル、APIサービス、リポジトリ実装
├── logic/            # ビジネスロジック（BLoC: events, states, blocs）
├── services/         # プラットフォームサービス（GPS、ローカルストレージ等）
├── utils/            # フォーマッター、ヘルパー、定数
├── view/             # UIレイヤー：ページ、ウィジェット
├── di/               # 依存性注入設定（get_it使用）
```

| フォルダ | Clean Architecture層 | 説明 |
|---------|---------------------|-----|
| `data` | Data Layer | ネットワーク、Hive/ローカルDB、rawモデルを処理 |
| `logic` | Domain Layer (簡略版) | BLoCを使用したビジネスロジック |
| `view` | Presentation Layer | UIコンポーネントとウィジェットツリー |
| `services` | External Layer | プラットフォーム固有タスク（GPS、権限等） |
| `di` | Cross-Cutting Concern | 依存性の登録と注入 |
| `utils` | Utility Layer | 共有ヘルパー（日付フォーマッター、温度変換等） |

### 使用技術

- **状態管理**: BLoC - 概念の分離が優れており、大規模プロジェクトにスケール可能
- **依存性注入**: Get It - BLoCに最適な依存性注入ライブラリ
- **ネットワーク**: Dio - 豊富な機能と柔軟性を持つHTTPクライアント
- **UI設計**: Modular Widget - どこでも使用可能な再利用可能コンポーネント

---

## English Version

### Project Overview
This is a Flutter weather forecast application built with a simplified version of Clean Architecture, focusing on development efficiency, maintainability, and scalability.

### System Requirements
- **Flutter Version**: 3.32.1 (stable channel)
- **Development Environment**: Android Studio / Xcode / Visual Studio Code

### Setup Instructions

#### 1. Flavors Configuration
This project uses manual Flavors setup to differentiate base URLs, app appearance, and staging/production environments.

**Android Studio Setup:**
1. Go to Launcher tab → Edit Configurations
2. Click Add New Configuration (+)
3. Fill Dart Entrypoint with `main_staging.dart` or `main_production.dart`
4. Fill name in build flavor (e.g., staging, production)
5. Apply → OK

**Xcode Setup:**
1. Go to TARGETS (RUNNER) → Build Settings
2. Change FLUTTER_TARGET from `lib/main.dart` to `lib/main_staging.dart` or `lib/main_production.dart`

**Command Line Execution (Optional):**
```bash
flutter run --flavor staging -t lib/main_staging.dart
flutter run --flavor production -t lib/main_production.dart
```

#### 2. Native Splash Screen
Using native splash screens to provide a natural startup experience like native Android and iOS apps.

```bash
flutter pub run flutter_native_splash:create
```

#### 3. Localization
Enables language localization and saves settings on first app launch.

```bash
flutter gen-l10n
```

**Note**: If you encounter errors, it might be due to caching issues. Close and reopen Android Studio.

#### 4. Hive Database
Using Hive as local database for persistence. Users can still access weather information without internet connection.

```bash
dart run build_runner build
```

#### 5. iOS Additional Setup
Sometimes iOS requires pod deintegration and reinstallation before launching the app.

```bash
cd ios
pod deintegrate
pod install
```

### Architecture

This project uses **Simplified Clean Architecture** to separate logic layers, making it easier to develop, maintain, and scale while remaining understandable for junior developers.

```
lib/
├── data/             # Models, API services, and repository implementations
├── logic/            # Business logic using BLoC (events, states, blocs)
├── services/         # Platform services (e.g., GPS, local storage)
├── utils/            # Formatters, helpers, constants
├── view/             # UI layer: pages, widgets
├── di/               # Dependency injection setup (using get_it)
```

| Folder | Clean Architecture Layer | Description |
|--------|-------------------------|-------------|
| `data` | Data Layer | Handles network, Hive/local DB, and raw models |
| `logic` | Domain Layer (Simplified) | Contains business logic using BLoC |
| `view` | Presentation Layer | UI components and widget trees |
| `services` | External Layer | Platform-specific tasks (GPS, permissions, etc.) |
| `di` | Cross-Cutting Concern | Registers and injects dependencies |
| `utils` | Utility Layer | Shared helpers (date formatter, temperature converter, etc.) |

### Technology Stack

- **State Management**: BLoC - Excellent separation of concerns, rock solid, and scales well to large projects
- **Dependency Injection**: Get It - Most suitable dependency injection for BLoC
- **Networking**: Dio - HTTP client with rich features and flexibility, supports custom interceptors
- **UI Design**: Modular Widget - Reusable components that can be used everywhere for cleaner and readable views

### Development Notes

- BLoC provides both global and local state management capabilities
- Dio enables custom interceptors and global error handling
- Modular widget concepts keep views clean and maintainable
- Simplified Clean Architecture balances development speed with code quality

### Getting Started

1. Clone the repository
2. Run `flutter pub get` to install dependencies
3. Follow the setup instructions above
4. Choose your target environment (staging/production)
5. Run the app using your preferred method

### Contributing

Please ensure you understand the architecture and follow the established patterns when contributing to this project.