part of 'application_bloc.dart';

abstract class ApplicationEvent {}

class ApplicationUpdateStateModelEvent extends ApplicationEvent {
  final GetMasterDataRs? config;

  ApplicationUpdateStateModelEvent({
    this.config,
  });
}
