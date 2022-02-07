import 'package:dartz/dartz.dart';
import 'package:git_stalck/app/modules/home/domain/repositories/search_repository.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/usecase.dart';
import '../entities/result_item_entity.dart';

class GetUserByQueryUseCase extends UseCase<List<ResultItemEntity>, String> {
  final SearchRepository _searchRepository;

  GetUserByQueryUseCase({required SearchRepository searchRepository})
      : _searchRepository = searchRepository;

  @override
  Future<Either<Failure, List<ResultItemEntity>>> call(String params) async {
    var response = await _searchRepository.searchByUser(query: params);
    return response.fold(
      (l) => Left(mapperExceptionToFailure(l)),
      (r) => Right(r),
    );
  }

  mapperExceptionToFailure(Exception exception) {
    switch (exception.runtimeType) {
      default:
        return Failure(message: 'Infelizmente houve um erro interno');
    }
  }
}
