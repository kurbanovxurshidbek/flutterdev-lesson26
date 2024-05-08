import 'package:bloc/bloc.dart';
import 'package:ngdemo23/services/log_service.dart';

class SampleFirstBloc extends Bloc<SampleFirstEvent, int> {
  SampleFirstBloc() : super(0) {
    LogService.i("Init SampleFirstBloc");

    on<SampleFirstEvent>((event, emit) {
      LogService.i("Sample First Event Called");
    });
    on<AddSampleEvent>((event, emit) {
      emit(state + 1);
    });
  }
}

class SampleFirstEvent {}

class AddSampleEvent extends SampleFirstEvent {}
