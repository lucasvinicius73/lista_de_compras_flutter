import 'package:flutter_modular/flutter_modular.dart';
import 'package:lista_de_compras/src/configuration/configuration_page.dart';
import 'package:lista_de_compras/src/home/home_module.dart';
import 'package:lista_de_compras/src/shared/stores/app_store.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.singleton((i) => AppStore()),
      ];
  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/home', module: HomeModule()),
        ChildRoute('/config',
            child: (context, args) => const ConfigurationPage())
      ];
}
