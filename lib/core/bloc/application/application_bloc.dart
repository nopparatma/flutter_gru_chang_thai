import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gru_chang_thai/core/models/get_master_data_rs.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'application_event.dart';

part 'application_state.dart';

class ApplicationBloc extends HydratedBloc<ApplicationEvent, ApplicationState> {
  @override
  ApplicationState? fromJson(Map<String, dynamic> json) {
    try {
      return ApplicationState.fromJson(json);
    } catch (e) {
      return const ApplicationState();
    }
  }

  @override
  Map<String, dynamic>? toJson(ApplicationState state) {
    try {
      return state.toJson();
    } catch (e) {
      return null;
    }
  }

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
