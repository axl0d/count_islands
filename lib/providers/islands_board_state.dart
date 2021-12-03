part of 'islands_board_controller.dart';

enum Status { init, loaded }

class IslandsBoardState {
  final Status status;
  final Board? board;
  final int? size;
  final List? matrix;
  final int? count;

  const IslandsBoardState({
    this.status = Status.init,
    this.board,
    this.size,
    this.matrix,
    this.count,
  });

  IslandsBoardState copyWith({
    Status? status,
    Board? board,
    int? size,
    List? matrix,
    int? count,
  }) =>
      IslandsBoardState(
        board: board ?? this.board,
        status: status ?? this.status,
        size: size ?? this.size,
        matrix: matrix ?? this.matrix,
        count: count ?? this.count,
      );
}
