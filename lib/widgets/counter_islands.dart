import 'package:count_islands/count_islands.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CounterIslands extends ConsumerWidget {
  const CounterIslands({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stateController = ref.watch(islandsBoardController);
    return Center(
      child: Text(
        'founded islands: count ${stateController.count}',
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }
}
