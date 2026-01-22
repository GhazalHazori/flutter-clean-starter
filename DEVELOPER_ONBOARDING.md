## Developer Onboarding

### 1. Project Philosophy
- **Clean Architecture first**: Separation of concerns is mandatory. Each layer has a clear responsibility and must not depend on UI details.
- **Feature-first structure**: All business logic lives inside feature folders. Cross-cutting concerns live under `core/`.
- **No shortcuts**: Temporary hacks, inline business logic in UI, and “quick fixes” are not acceptable.
- **Readability over cleverness**: Code must be easy to read for juniors and seniors. Prefer explicitness over magic.
- **Production-ready by default**: Treat every change as if it will ship to production.

### 2. Architecture Rules
- **Layers**:
  - **Presentation**: Widgets, Cubits/Blocs, and simple view models. No business rules here.
  - **Domain**: Entities, repositories (abstract), and use cases. Pure Dart, no Flutter imports.
  - **Data**: Models, data sources (remote/local), and repository implementations. Handles I/O and mapping to domain.
- **Dependencies direction**:
  - Presentation ➜ Domain
  - Data ➜ Domain
  - Domain ➜ (no one)
- **Cross-cutting**:
  - Shared error types, network client, theme, localization, and base widgets live in `core/`.
  - Do not import feature code inside `core/`.

### 3. How to Create a New Feature
1. **Create folder structure**
   - `lib/features/<feature_name>/data/`
   - `lib/features/<feature_name>/domain/`
   - `lib/features/<feature_name>/presentation/`
2. **Domain layer**
   - Define `entities` representing core business objects.
   - Define `repositories` (abstract) that declare required operations.
   - Implement `usecases` that expose single, focused actions.
3. **Data layer**
   - Create `models` that extend entities and map from/to JSON or other formats.
   - Implement `datasources` (remote/local) that call APIs, caches, databases, etc.
   - Implement `repositories` that use data sources and convert exceptions to `Failure`s.
4. **Presentation layer**
   - Create `cubit`/`bloc` classes to handle all state and orchestrate use cases.
   - Create `pages` and `widgets` that:
     - Subscribe to Cubit/Bloc states.
     - Dispatch events or call Cubit methods.
     - Contain **no business logic** and no direct API calls.
5. **Dependency injection**
   - Register:
     - Data sources
     - Repository implementation
     - Use cases
     - Cubits/Blocs
   - in `di/injection_container.dart`.
6. **Routes**
   - Add a static `routeName` on your main page.
   - Wire it in `routes/app_router.dart`.

### 4. UI Rules (Theme & Localization)
- **Theme**
  - Do **not** hardcode colors, font sizes, padding, or radii.
  - Use:
    - Colors from `AppTheme` / `AppColors` (via `Theme.of(context)`).
    - Text from `Theme.of(context).textTheme`.
    - Spacing from `AppSpacing`.
  - Rebranding must be possible by editing only:
    - `core/theme/light_colors.dart`
    - `core/theme/dark_colors.dart`
    - Optionally text styles in `core/theme/app_text_styles.dart`.
- **Localization**
  - All user-visible text must:
    - Be defined in `lib/l10n/*.json`.
    - Be accessed via `AppLocalizations.of(context).tr('<key>')`.
  - Default language is **Arabic** (`ar`); RTL is expected to work out of the box.
  - English is optional but already wired.
  - Do not concatenate localized and non-localized strings in widgets; build full messages in localization files where possible.

### 5. Common Mistakes to Avoid
- **Business logic in widgets**
  - Do not parse responses, apply domain rules, or manipulate entities inside widgets.
  - Move logic into Cubits/Blocs or use cases.
- **Skipping domain layer**
  - Do not call repositories directly from presentation. Always go through a use case.
- **Leaking data models**
  - UI and domain should depend on entities, not on data models.
- **Hardcoded values**
  - Avoid magic numbers for padding, radii, font sizes, colors, and strings.
  - Use `AppSpacing`, theme, and localization.
- **Tight coupling**
  - Avoid importing feature-specific code into other features without a clear boundary.

### 6. PR Expectations
- **Before opening a PR**
  - Code compiles and basic flows are manually tested.
  - No commented-out code.
  - No unused imports or dead code.
  - All new strings are localized.
  - All UI respects theme and spacing rules.
- **PR content**
  - Small, focused changes with a clear purpose.
  - Accurate and concise PR description:
    - What was changed.
    - Why it was changed.
    - How it was tested.
- **Review behavior**
  - Respond to review comments promptly and professionally.
  - Avoid pushing new unrelated changes into an existing PR.

### 7. Code Quality Expectations
- **Readability**
  - Clear naming (no abbreviations without strong reason).
  - Small methods and classes with single responsibilities.
  - Consistent style across the project.
- **Reliability**
  - Handle failures using `Failure` and error states in Cubits/Blocs.
  - Do not swallow exceptions silently.
- **Maintainability**
  - Follow the existing folder structure.
  - Avoid custom patterns unless discussed with the team.
  - Prefer composition over inheritance where possible.

If you are unsure where something belongs, ask yourself: *“Is this UI? Domain? Data? Cross-cutting?”* and place it accordingly. When in doubt, ask the team before introducing new patterns.


