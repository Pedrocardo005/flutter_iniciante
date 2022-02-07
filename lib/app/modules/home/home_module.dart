import 'package:flutter_modular/flutter_modular.dart';

import 'domain/usecases/get_user_by_query_usecase.dart';
import 'external/datasources/search_datasource_impl.dart';
import 'infra/repositories/search_repository_impl.dart';
import 'presenter/home_controller.dart';
import 'presenter/home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    // Data Sources
    Bind((i) => SearchDataSourceImpl(httpClient: i())),
    // Repositories
    Bind((i) => SearchRepositoryImpl(searchDataSource: i())),
    // Usecase
    Bind((i) => GetUserByQueryUseCase(searchRepository: i())),
    // Controllers
    Bind((i) => HomeController(useCase: i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (_, args) {
        return const HomePage();
      },
    ),
  ];
}
