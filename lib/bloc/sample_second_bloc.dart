import 'package:bloc/bloc.dart';
import '../service/log_service.dart';

class SampleSecondBloc extends Bloc<SampleSecondEvent, int> {
  SampleSecondBloc() : super(0) {
    on<SampleSecondEvent>((event, emit) {
      LogService.i('Sample Second Event Called');
    });
  }
}

class SampleSecondEvent {}