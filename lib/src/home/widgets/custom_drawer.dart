import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:lista_de_compras/src/shared/stores/app_store.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final appStore = context.watch<AppStore>(
      (store) => store.syncDate,
    );

    final syncDate = appStore.syncDate.value;

    var syncDateText = 'Never';

    if (syncDate != null) {
      final format = DateFormat('dd/MM/yyyy ás hh:mm');
      syncDateText = format.format(syncDate);
    }
    return NavigationDrawer(
      onDestinationSelected: (index) {
        if (index == 1) {
          Navigator.of(context).pop();
          Navigator.of(context).pushNamed('/config');
        }
      },
      children: [
        Padding(
          padding:
              const EdgeInsets.only(right: 16, top: 28, left: 16, bottom: 16),
          child: Text(
            'Opções',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        NavigationDrawerDestination(
          icon: const Icon(Icons.sync),
          label: SizedBox(
            width: 210,
            child: Row(
              children: [
                const Text('Sincronizar'),
                const Spacer(),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  syncDateText,
                  style: Theme.of(context).textTheme.bodySmall,
                )
              ],
            ),
          ),
        ),
        const NavigationDrawerDestination(
          icon: Icon(Icons.sync),
          label: Text('Configurações'),
        ),
      ],
    );
  }
}
