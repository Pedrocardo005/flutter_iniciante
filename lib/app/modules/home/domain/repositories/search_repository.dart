import 'package:dartz/dartz.dart';

import '../entities/result_item_entity.dart';

abstract class SearchRepository {
  Future<Either<Exception, List<ResultItemEntity>>> searchByUser(
      {required String query});
}
