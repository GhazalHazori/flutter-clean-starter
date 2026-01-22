import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/sample_entity.dart';
import '../repositories/sample_repository.dart';

class GetSamplesUseCase {
  GetSamplesUseCase(this._repository);

  final SampleRepository _repository;

  Future<Either<Failure, List<SampleEntity>>> call() {
    return _repository.getSamples();
  }
}


