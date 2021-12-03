import 'package:count_islands/count_islands.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:number_of_islands/number_of_islands.dart';

class CellItem extends ConsumerWidget {
  const CellItem(this.index, {Key? key}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cells = ref.watch(islandsBoardController).board!.cells;
    return GestureDetector(
      onTap: () {
        ref
            .read(islandsBoardController.notifier)
            .updateBoard(cells[index], index);
      },
      child: Card(
        color: cells[index].type == CellType.land
            ? Colors.green
            : Colors.cyan[200],
        child: Center(
          child: Text('$index'),
        ),
      ),
    );
  }
}
