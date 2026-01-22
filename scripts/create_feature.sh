#!/bin/bash

# ================================
# Flutter Advanced Feature Generator
# ================================

# Check arguments
FEATURE_NAME=$1
WITH_API=$2  # Optional: --with-api

if [ -z "$FEATURE_NAME" ]; then
  echo "❌ Error: Feature name is required."
  echo "👉 Usage: ./scripts/create_feature.sh feature_name [--with-api]"
  exit 1
fi

# Validate snake_case
if [[ ! "$FEATURE_NAME" =~ ^[a-z_][a-z0-9_]*$ ]]; then
  echo "❌ Error: Feature name must be snake_case (e.g., product_list)"
  exit 1
fi

BASE_PATH="lib/features/$FEATURE_NAME"

if [ -d "$BASE_PATH" ]; then
  echo "❌ Error: Feature '$FEATURE_NAME' already exists."
  exit 1
fi

echo "🚀 Creating feature: $FEATURE_NAME"

# --- Create directories ---
mkdir -p $BASE_PATH/data/{datasources,models,repositories}
mkdir -p $BASE_PATH/domain/{entities,repositories,usecases}
mkdir -p $BASE_PATH/presentation/{bloc,screens,widgets}

# --- Create placeholder files ---
DATA_PATH="$BASE_PATH/data"
DOMAIN_PATH="$BASE_PATH/domain"
PRESENTATION_PATH="$BASE_PATH/presentation"

touch $DATA_PATH/datasources/${FEATURE_NAME}_remote_datasource.dart
touch $DATA_PATH/models/${FEATURE_NAME}_model.dart
touch $DATA_PATH/repositories/${FEATURE_NAME}_repository_impl.dart

touch $DOMAIN_PATH/entities/${FEATURE_NAME}.dart
touch $DOMAIN_PATH/repositories/${FEATURE_NAME}_repository.dart
touch $DOMAIN_PATH/usecases/get_${FEATURE_NAME}_usecase.dart

touch $PRESENTATION_PATH/bloc/${FEATURE_NAME}_bloc.dart
touch $PRESENTATION_PATH/screens/${FEATURE_NAME}_screen.dart
touch $PRESENTATION_PATH/widgets/${FEATURE_NAME}_widget.dart

# --- Populate Bloc boilerplate ---
cat <<EOL > $PRESENTATION_PATH/bloc/${FEATURE_NAME}_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_${FEATURE_NAME}_usecase.dart';

class ${FEATURE_NAME^}Bloc extends Cubit<int> {
  final Get${FEATURE_NAME^}UseCase useCase;

  ${FEATURE_NAME^}Bloc(this.useCase) : super(0);

  void load() {
    // TODO: call useCase and emit state
  }
}
EOL

# --- Populate UseCase boilerplate ---
cat <<EOL > $DOMAIN_PATH/usecases/get_${FEATURE_NAME}_usecase.dart
class Get${FEATURE_NAME^}UseCase {
  // TODO: inject repository and implement execute()
  void execute() {}
}
EOL

# --- DI placeholder ---
DI_FILE="lib/di/service_locator.dart"
if ! grep -q "$FEATURE_NAME" $DI_FILE 2>/dev/null; then
  echo "// TODO: register $FEATURE_NAME dependencies" >> $DI_FILE
fi

# --- Route placeholder ---
ROUTES_FILE="lib/routes/app_routes.dart"
if ! grep -q "$FEATURE_NAME" $ROUTES_FILE 2>/dev/null; then
  echo "// TODO: add route for $FEATURE_NAME" >> $ROUTES_FILE
fi

# --- Optional API flag ---
if [ "$WITH_API" == "--with-api" ]; then
  echo "// TODO: Implement API calls for $FEATURE_NAME" >> $DATA_PATH/datasources/${FEATURE_NAME}_remote_datasource.dart
fi

echo "✅ Feature '$FEATURE_NAME' created successfully."
echo "📁 Location: lib/features/$FEATURE_NAME"
