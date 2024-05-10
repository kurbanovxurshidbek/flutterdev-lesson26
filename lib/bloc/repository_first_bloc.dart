import 'package:bloc/bloc.dart';

import '../repository/first_repository.dart';

class RepositoryFirstBloc extends Bloc<RepositoryFirstEvent, int> {
  final FirstRepository _repositoryFirstSample;

  RepositoryFirstBloc(this._repositoryFirstSample) : super(0) {
    on<RepositoryFirstEvent>((event, emit) async {
      var data = await _repositoryFirstSample.load();
      emit(data);
    });
  }
}

class RepositoryFirstEvent {}
