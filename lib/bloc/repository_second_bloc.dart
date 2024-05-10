import 'package:bloc/bloc.dart';

import '../repository/first_repository.dart';
import '../repository/second_repository.dart';

class RepositorySecondBloc extends Bloc<MultiEvent, int> {
  final FirstRepository _firstRepository;
  final SecondRepository _secondRepository;

  RepositorySecondBloc(this._firstRepository, this._secondRepository)
      : super(0) {
    on<RepositoryFirstMultiEvent>((event, emit) async {
      var data = await _firstRepository.load();
      emit(data);
    });
    on<RepositorySecondMultiEvent>((event, emit) async {
      var data = await _secondRepository.load();
      emit(data);
    });
  }
}

abstract class MultiEvent {}

class RepositoryFirstMultiEvent extends MultiEvent {}

class RepositorySecondMultiEvent extends MultiEvent {}
