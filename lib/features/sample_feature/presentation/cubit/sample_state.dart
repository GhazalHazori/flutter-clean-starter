part of 'sample_cubit.dart';

enum SampleStatus { initial, loading, success, failure }

class SampleState extends Equatable {
  final SampleStatus status;
  final List<SampleEntity> items;
  final String? errorMessage;

  const SampleState({
    required this.status,
    required this.items,
    this.errorMessage,
  });

  const SampleState.initial()
      : status = SampleStatus.initial,
        items = const [],
        errorMessage = null;

  SampleState copyWith({
    SampleStatus? status,
    List<SampleEntity>? items,
    String? errorMessage,
  }) {
    return SampleState(
      status: status ?? this.status,
      items: items ?? this.items,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, items, errorMessage];
}


