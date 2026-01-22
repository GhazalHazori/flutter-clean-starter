import 'dart:async';

import '../../../../core/error/exceptions.dart';
import '../../../../core/network/api_client.dart';
import '../models/sample_model.dart';

abstract class SampleRemoteDataSource {
  Future<List<SampleModel>> getSamples();
}

/// Example REST data source.
///
/// This uses a placeholder endpoint to demonstrate the flow. Replace
/// `baseUrl` and `path` with real values when integrating an API.
class SampleRemoteDataSourceImpl implements SampleRemoteDataSource {
  SampleRemoteDataSourceImpl()
      : _client = ApiClient(baseUrl: 'https://example.com/api');

  final ApiClient _client;

  @override
  Future<List<SampleModel>> getSamples() async {
    try {
      // Placeholder endpoint
      final response = await _client.get<List<dynamic>>('/samples');
      final data = response.data ?? [];

      return data
          .map((e) => SampleModel.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}


