import 'package:conduit_boilerplate/application_configuration.dart';
import 'package:conduit_boilerplate/conduit_boilerplate.dart';

Future main() async {
  final ApplicationConfiguration config = ApplicationConfiguration("config.yaml");

  final app = Application<ConduitBoilerplateChannel>()
  ..options.configurationFilePath = "config.yaml"
  ..options.context["microserviceName"] = config.microserviceName!
  ..options.port = config.listeningPort!;

  await app.startOnCurrentIsolate();

  print("Microservice ${app.options.context["microserviceName"]} listening on port ${app.options.port}");
}
