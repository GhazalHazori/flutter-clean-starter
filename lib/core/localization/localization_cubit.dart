import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocalizationState {
  final Locale locale;

  const LocalizationState({required this.locale});

  LocalizationState copyWith({Locale? locale}) {
    return LocalizationState(locale: locale ?? this.locale);
  }
}

/// Controls the current app locale.
///
/// Default is Arabic (`ar`). UI must not store or guess locale; it listens to
/// this Cubit only.
class LocalizationCubit extends Cubit<LocalizationState> {
  LocalizationCubit()
      : super(const LocalizationState(locale: Locale('ar')));

  void loadDefaultLocale() {
    // Hook for future persistence or device-based selection.
    emit(const LocalizationState(locale: Locale('ar')));
  }

  void setArabic() {
    emit(state.copyWith(locale: const Locale('ar')));
  }

  void setEnglish() {
    emit(state.copyWith(locale: const Locale('en')));
  }

  void setLocale(Locale locale) {
    emit(state.copyWith(locale: locale));
  }
}


