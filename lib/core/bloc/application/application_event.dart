part of 'application_bloc.dart';

abstract class ApplicationEvent {}

class ApplicationUpdateStateModelEvent extends ApplicationEvent {
  final GetMasterConfigRs? config;

  ApplicationUpdateStateModelEvent({
    this.config,
  });
}
