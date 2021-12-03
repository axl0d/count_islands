import 'package:count_islands/count_islands.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class IslandsBoardPage extends StatelessWidget {
  const IslandsBoardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(title),
      ),
      body: const _Body(),
    );
  }
}

class _Body extends ConsumerWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stateController = ref.watch(islandsBoardController);
    switch (stateController.status) {
      case Status.loaded:
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomScrollView(
            slivers: [
              SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) => CellItem(index),
                  childCount: stateController.size! * stateController.size!,
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: stateController.size!,
                ),
              ),
              const SliverPadding(
                padding: EdgeInsets.only(top: 8),
                sliver: SliverToBoxAdapter(
                  child: CounterIslands(),
                ),
              ),
            ],
          ),
        );
      case Status.init:
      default:
        return const Center(child: CircularProgressIndicator());
    }
  }
}
