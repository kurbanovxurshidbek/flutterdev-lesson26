import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';

import '../repository/concurrency_repository.dart';
import '../services/log_service.dart';

class ConcurrencyBloc extends Bloc<ShowImageEvent, ShowImageState> {
  final ConcurrencyRepository _concurrencyRepository;

  ConcurrencyBloc(this._concurrencyRepository)
      : super(const ShowImageState.init()) {
    on<ShowImageEvent>(_showImage, transformer: droppable());
  }

  void _showImage(event, emit) async {
    emit(state.copyWith(count: state.count + 1));
    var path = await _concurrencyRepository.getImage(state.count);
    emit(state.copyWith(path: path));
  }

  @override
  void onTransition(Transition<ShowImageEvent, ShowImageState> transition) {
    super.onTransition(transition);
    LogService.i(transition.toString());
  }
}

class ShowImageEvent {}

class ShowImageState extends Equatable {
  final int count;
  final String? path;

  const ShowImageState({
    required this.count,
    this.path = '',
  });

  ShowImageState copyWith({
    int? count,
    String? path,
  }) {
    return ShowImageState(count: count ?? this.count, path: path ?? this.path);
  }

  const ShowImageState.init() : this(count: -1);

  @override
  List<Object?> get props => [count, path];
}
