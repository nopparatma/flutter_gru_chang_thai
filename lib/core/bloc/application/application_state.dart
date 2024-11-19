part of 'application_bloc.dart';

class ApplicationState extends Equatable {
  final GetMasterConfigRs? config;

  const ApplicationState({this.config});

  ApplicationState copyWith({GetMasterConfigRs? config}) {
    return ApplicationState(config: config ?? this.config);
  }

  @override
  String toString() {
    return 'ApplicationState{config: $config}';
  }

  @override
  List<Object?> get props => [config];

  // Deserialize from JSON
  factory ApplicationState.fromJson(Map<String, dynamic> json) {
    return ApplicationState(
      config: json['config'] != null ? GetMasterConfigRs.fromJson(json['config'] as Map<String, dynamic>) : null,
    );
  }

  // Serialize to JSON
  Map<String, dynamic> toJson() {
    return {
      'config': config?.toJson(),
    };
  }

  List<String> getConfigValues(String key) {
    return config?.data?.masterConfigs?.where((element) => element.key == key).map((e) => e.value ?? '').toList() ?? [];
  }
}
