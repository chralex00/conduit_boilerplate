import 'package:conduit_boilerplate/conduit_boilerplate.dart';

class ApplicationConfiguration extends Configuration {
  ApplicationConfiguration(String fileName) : super.fromFile(File(fileName));

  String? microserviceName;
  int? listeningPort;
}
