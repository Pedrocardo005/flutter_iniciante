import 'package:dartz/dartz.dart';

import '../../../../../core/http_adapter/http_client.dart';
import '../../infra/datasources/search_datasource.dart';
import '../../infra/models/result_item_model.dart';

class SearchDataSourceImpl implements SearchDataSource {
  final HttpClient _httpClient;

  SearchDataSourceImpl({required HttpClient httpClient})
      : _httpClient = httpClient;

  @override
  Future<Either<Exception, List<ResultItemModel>>> searchByUser(
      {required String query}) async {
    try {
      final response = await _httpClient
          .request('https://api.github.com/search/users', data: {'q': query});
      final items = response['items'] as List;
      final data = items
          .map(
            (e) => ResultItemModel(
              login: e['login'],
              avatarUrl: e['avatar_url'],
              url: e['url'],
            ),
          )
          .toList();
      return Right(data);
    } on Exception catch (e) {
      return Left(e);
    }
  }
}
