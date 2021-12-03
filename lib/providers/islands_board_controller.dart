import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:number_of_islands/number_of_islands.dart';

part 'islands_board_state.dart';

final islandsBoardController =
    StateNotifierProvider<IslandsBoardController, IslandsBoardState>((ref) {
  return IslandsBoardController();
});

class IslandsBoardController extends StateNotifier<IslandsBoardState> {
  IslandsBoardController() : super(const IslandsBoardState());

  late NumberOfIslands numberOfIslands;

  void createBoard(int size) {
    final board = Board(size);
    numberOfIslands = NumberOfIslands(size);
    final matrix = board.createBoard();
    state = state.copyWith(
      board: board,
      status: Status.loaded,
      size: size,
      matrix: matrix,
      count: numberOfIslands.countIslands(matrix),
    );
  }

  void updateBoard(Cell cell, int index) {
    final board = state.board!;
    final matrix = state.matrix!;
    final updated = board.updateBoard(matrix, cell.x, cell.y, index);
    state = state.copyWith(
      matrix: updated,
      count: numberOfIslands.countIslands(updated),
    );
  }
}
