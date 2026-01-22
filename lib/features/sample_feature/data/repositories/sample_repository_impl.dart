import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/sample_entity.dart';
import '../../domain/repositories/sample_repository.dart';
import '../datasources/sample_remote_data_source.dart';

class SampleRepositoryImpl implements SampleRepository {
  SampleRepositoryImpl({required SampleRemoteDataSource remoteDataSource})
      : _remoteDataSource = remoteDataSource;

  final SampleRemoteDataSource _remoteDataSource;

  @override
  Future<Either<Failure, List<SampleEntity>>> getSamples() async {
    try {
      final result = await _remoteDataSource.getSamples();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(NetworkFailure(e.toString()));
    }
  }
}


