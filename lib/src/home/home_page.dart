import 'package:flutter/material.dart';
import 'package:lista_de_compras/src/shared/widgets/user_image_button.dart';

import 'widgets/custom_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        title: const Text('Listinha'),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 8),
            child: UserImageButton(),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('New List'),
        icon: const Icon(
          Icons.edit,
        ),
        onPressed: () {
          Navigator.of(context).pushNamed('./edit');
        },
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: SegmentedButton<int>(
                segments: const [
                  ButtonSegment(value: 0, label: Text('Todos')),
                  ButtonSegment(value: 1, label: Text('Pendendentes')),
                  ButtonSegment(value: 2, label: Text('Concluidas')),
                  ButtonSegment(value: 3, label: Text('Desativadas'))
                ],
                selected: const {1},
                onSelectionChanged: (values) {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
