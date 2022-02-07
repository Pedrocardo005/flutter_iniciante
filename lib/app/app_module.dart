import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../core/http_adapter/dio_adapter.dart';
import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => Dio()),
    Bind((i) => DioAdapter(dio: i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: HomeModule()),
  ];
}
