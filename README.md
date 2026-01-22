## Flutter Clean Starter Template

### 1. Project Overview
This repository provides a **production-ready Flutter starter template** designed for long-term, scalable applications. It enforces:
- **Feature-first structure**
- **Clean Architecture**
- **Bloc/Cubit-based state management**
- **Centralized theming**
- **JSON-based localization with Arabic default**

The goal is to minimize setup time for new apps while enforcing strict architectural and coding standards.

### 2. Architecture Explanation
- **Clean Architecture**
  - **Presentation layer** (`presentation/`):
    - Widgets, pages, Cubits/Blocs, and UI state.
    - No business logic, no API calls, no data parsing.
  - **Domain layer** (`domain/`):
    - Entities, abstract repositories, and use cases.
    - Pure Dart, no Flutter imports, UI-agnostic.
  - **Data layer** (`data/`):
    - Models, remote/local data sources, and repository implementations.
    - Responsible for talking to REST APIs, local storage, and mapping to domain entities.
- **Core module** (`core/`):
  - Cross-cutting concerns shared by all features:
    - Theme system
    - Localization
    - Network client
    - Error handling
    - Shared widgets and utilities
- **Dependency injection**
  - Implemented using `get_it` in `di/injection_container.dart`.
  - All external dependencies (data sources, repositories, use cases, Cubits) must be registered here.

### 3. Folder Structure Explanation

```text
lib/
  core/
    theme/               # Theme, colors, spacing, text styles, theme cubit
    localization/        # App localization and localization cubit
    constants/           # Global constants (to be added per project need)
    network/             # REST client and network utilities
    widgets/             # Shared reusable widgets
    utils/               # Pure utility helpers
    error/               # Exceptions and failures

  features/
    sample_feature/
      data/              # Models, datasources, repository implementations
      domain/            # Entities, repositories (abstract), use cases
      presentation/      # Cubits/Blocs, pages, widgets

  di/                    # Dependency injection setup
  routes/                # Central app routing
  app.dart               # Root widget with theme & localization wiring
  main.dart              # Application entrypoint
```

Additional localization assets:

```text
lib/
  l10n/
    ar.json              # Default Arabic translations
    en.json              # Optional English translations
```

### 4. Theme Rules
- **No hardcoded colors, font sizes, or spacing in widgets.**
- Use:
  - Colors from `AppTheme` / `AppColors` (via `Theme.of(context)`).
  - Text styles from `Theme.of(context).textTheme`.
  - Spacing from `AppSpacing`.
- Rebranding the app should only require changes to:
  - `core/theme/light_colors.dart`
  - `core/theme/dark_colors.dart`
  - (Optionally) `core/theme/app_text_styles.dart`
- All components must respect light and dark themes.

### 5. Localization Rules
- Default language: **Arabic** (`ar`) with RTL support.
- English (`en`) is optional but already set up.
- All user-visible text:
  - Must be stored in JSON files under `lib/l10n/`.
  - Must be accessed via `AppLocalizations.of(context).tr('<key>')`.
- No hardcoded text literals in widgets.
- Localization keys should be:
  - Namespaced by feature, e.g. `home.title`, `auth.login_button`.

### 6. Feature Development Rules
- Each feature must follow:

```text
lib/features/<feature_name>/
  data/
    datasources/
    models/
    repositories/
  domain/
    entities/
    repositories/
    usecases/
  presentation/
    cubit/ or bloc/
    pages/
    widgets/
```

- **Presentation**
  - Only UI logic (state rendering, navigation).
  - Uses Cubits/Blocs to manage all mutable state.
- **Domain**
  - No dependencies on Flutter or external packages (beyond `equatable` / pure Dart).
  - Contains business rules and use cases.
- **Data**
  - Communicates with APIs, local storage, and other I/O.
  - Converts exceptions to `Failure` objects.

### 7. Naming Conventions
- **Folders**
  - `data/`, `domain/`, `presentation/`, `widgets/`, `utils/`, `theme/`, `network/`.
- **Classes**
  - Entities: `UserEntity`, `ProductEntity`.
  - Models: `UserModel`, `ProductModel`.
  - Repositories (abstract): `UserRepository`.
  - Repositories (impl): `UserRepositoryImpl`.
  - Use cases: `GetUserDetailUseCase`.
  - Cubits: `UserCubit`, `ThemeCubit`, `LocalizationCubit`.
  - States: `UserState`, `UserStatus`.
  - Pages: `UserPage`, `HomePage`.
  - Widgets: `UserCard`, `PrimaryButton`.
- **Files**
  - Snake case: `user_entity.dart`, `get_user_detail_use_case.dart`.

### 8. What Is NOT Allowed
- Business logic inside widgets or UI code.
- Direct HTTP or database calls from presentation layer.
- Skipping domain layer and calling repositories directly from UI.
- Hardcoded:
  - Colors
  - Font sizes
  - Spacing values
  - User-visible strings
- Silent exception handling (`catch (e) {}` with no action).
- Feature-specific logic inside `core/`.

### 9. How to Start a New Feature
1. **Create folders**
   - `lib/features/<feature_name>/data/`
   - `lib/features/<feature_name>/domain/`
   - `lib/features/<feature_name>/presentation/`
2. **Design domain**
   - Identify entities and operations.
   - Define:
     - `entities/`
     - `repositories/` (abstract)
     - `usecases/`
3. **Implement data**
   - Create models extending entities.
   - Implement data sources (REST, cache, etc.).
   - Implement repository that:
     - Uses data sources.
     - Maps exceptions to `Failure`s.
4. **Add presentation**
   - Create Cubit/Bloc with clear states.
   - Create page + widgets that:
     - React to state.
     - Dispatch events / call Cubit methods.
5. **Wire DI**
   - Register data sources, repository, use cases, and Cubit/Bloc in
     `di/injection_container.dart`.
6. **Register routes & localization**
   - Add `routeName` constants in your main feature page.
   - Wire route into `routes/app_router.dart`.
   - Add necessary localization keys into `lib/l10n/*.json`.

Follow the `DEVELOPER_ONBOARDING.md` document for stricter onboarding rules, PR expectations, and code quality guidelines.

