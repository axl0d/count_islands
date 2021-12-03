import 'package:count_islands/count_islands.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SizeForm extends StatefulWidget {
  const SizeForm({Key? key}) : super(key: key);

  @override
  State<SizeForm> createState() => _SizeFormState();
}

class _SizeFormState extends State<SizeForm> {
  final formKey = GlobalKey<FormState>();
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Ingrese el tamaño del tablero',
            style: Theme.of(context).textTheme.headline4,
          ),
          TextFormField(
            controller: controller,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(hintText: 'por ejemplo: 4'),
            validator: (value) {
              if (value == null || value.isEmpty) return 'no puede ser vacío';
              final size = int.parse(value);
              if (size < 2) return 'el número debe ser mayor a 2';
              if (size > 10) return 'el número debe ser menor a 10';
              return null;
            },
          ),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.bottomRight,
            child: Consumer(
              builder: (_, ref, __) => ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    final size = int.parse(controller.value.text);
                    ref.read(islandsBoardController.notifier).createBoard(size);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const IslandsBoardPage(),
                      ),
                    );
                  }
                },
                child: const Text('continuar'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
