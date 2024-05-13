import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';

import '../repository/movie_repository.dart';
import '../services/log_service.dart';

class MovieBloc extends Bloc<SearchMovieEvent, List<String>> {
  final MovieRepository _movieRepository;

  MovieBloc(this._movieRepository) : super([]) {
    on<SearchMovieEvent>((event, emit) async {
      var result = await _movieRepository.search(event.keyword);
      emit(result);
    },
        transformer: (events, mapper) =>
            events.debounceTime(const Duration(milliseconds: 1000)).flatMap(mapper),
    );
  }

  @override
  void onChange(Change<List<String>> change) {
    super.onChange(change);
    LogService.i(change.toString());
  }

  @override
  void onTransition(Transition<SearchMovieEvent, List<String>> transition) {
    super.onTransition(transition);
    LogService.i(transition.toString());
  }
}

class SearchMovieEvent extends Equatable {
  String keyword;

  SearchMovieEvent(this.keyword);

  @override
  List<Object?> get props => [];
}
