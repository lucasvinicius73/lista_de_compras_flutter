import 'package:flutter_modular/flutter_modular.dart';
import 'package:lista_de_compras/src/configuration/configuration_page.dart';
import 'package:lista_de_compras/src/configuration/services/configuration_service.dart';
import 'package:lista_de_compras/src/home/home_module.dart';
import 'package:lista_de_compras/src/shared/stores/app_store.dart';
import 'package:realm/realm.dart';

import 'shared/services/realm/realm_config.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.instance<Realm>(Realm(config)),
        AutoBind.singleton(AppStore.new),
        AutoBind.factory<ConfigurationService>(ConfigurationServiceImpl.new),
      ];
  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/home', module: HomeModule()),
        ChildRoute(
          '/config',
          child: (context, args) => const ConfigurationPage(),
        )
      ];
}
