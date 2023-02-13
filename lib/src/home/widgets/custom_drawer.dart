import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
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
          label: Row(
            children: [
              const Text('Sincronizar'),
              const SizedBox(
                width: 10,
              ),
              Text(
                '09/02/2023 as 10:55',
                style: Theme.of(context).textTheme.bodySmall,
              )
            ],
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
