import 'package:equatable/equatable.dart';

class App extends Equatable{
  final String name;
  final String version;
  final String buildNumber;

  const App({
    required this.name,
    required this.version,
    required this.buildNumber,
});

  @override
  String toString() {
    return 'App{name: $name, version: $version, buildNumber: $buildNumber}';
  }

  @override
  List<Object?> get props => [name, version, buildNumber];
}