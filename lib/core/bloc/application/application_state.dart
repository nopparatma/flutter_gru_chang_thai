part of 'application_bloc.dart';

class ApplicationState extends Equatable {
  final GetMasterDataRs? config;

  const ApplicationState({this.config});

  ApplicationState copyWith({GetMasterDataRs? config}) {
    return ApplicationState(config: config ?? this.config);
  }

  @override
  String toString() {
    return 'ApplicationState{config: $config}';
  }

  @override
  List<Object?> get props => [config];
}
