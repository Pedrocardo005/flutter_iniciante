import 'package:mobx/mobx.dart';

import '../../../../core/usecase.dart';
import '../domain/entities/result_item_entity.dart';
import 'states/search_state.dart';

part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  final UseCase<List<ResultItemEntity>, String> _useCase;

  @observable
  SearchState state = SearchInitialState();

  HomeControllerBase({required UseCase<List<ResultItemEntity>, String> useCase})
      : _useCase = useCase;

  Future searchDev(String value) async {
    state = SearchLoadingState();
    if (value.length < 3) {
      state = SearchInitialState();
    } else {
      var response = await _useCase.call(value);
      state = response.fold(
        (l) =>
            SearchFailureState(message: 'Não foi possível realizar a busca.'),
        (r) => SearchSuccessState(resultItem: r),
      );
    }
  }
}
