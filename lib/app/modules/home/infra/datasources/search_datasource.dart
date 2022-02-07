import 'package:dartz/dartz.dart';

import '../models/result_item_model.dart';

abstract class SearchDataSource {
  Future<Either<Exception, List<ResultItemModel>>> searchByUser(
      {required String query});
}
