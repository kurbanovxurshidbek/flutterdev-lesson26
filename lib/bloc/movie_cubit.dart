import 'package:bloc/bloc.dart';

import '../repository/movie_repository.dart';
import '../services/log_service.dart';

class MovieCubit extends Cubit<List<String>> {
  MovieRepository movieRepository;

  MovieCubit(this.movieRepository) : super([]);

  void search(String keyword) async {
    var result = await movieRepository.search(keyword);
    emit(result);
  }

  @override
  void onChange(Change<List<String>> change) {
    super.onChange(change);
    LogService.i(change.toString());
  }
}
