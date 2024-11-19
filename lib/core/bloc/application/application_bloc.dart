import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gru_chang_thai/core/models/get_master_config_rs.dart';

part 'application_event.dart';

part 'application_state.dart';

class ApplicationBloc extends Bloc<ApplicationEvent, ApplicationState> {
  ApplicationBloc() : super(const ApplicationState()) {
    // ApplicationUpdateStateModelEvent
    on<ApplicationUpdateStateModelEvent>((event, emit) => mapEventToState(event, emit));
  }

  Future<void> mapEventToState(ApplicationUpdateStateModelEvent event, Emitter<ApplicationState> emit) async {
    emit(
      state.copyWith(
        config: event.config ?? state.config,
      ),
    );
  }
}
