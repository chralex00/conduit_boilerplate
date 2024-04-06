import 'package:conduit_boilerplate/conduit_boilerplate.dart';
import 'package:pubspec_parse/pubspec_parse.dart';

class ConduitBoilerplateChannel extends ApplicationChannel {
  @override
  Future prepare() async {
    logger.onRecord.listen((rec) => print("$rec ${rec.error ?? ""} ${rec.stackTrace ?? ""}"));
  }

  @override
  Controller get entryPoint {
    final Router router = Router();

    final String pubspec = File('pubspec.yaml').readAsStringSync();
    final Pubspec pubspecParsed = Pubspec.parse(pubspec);

    router.route("/api/healthcheck").linkFunction((request) async {
      return Response.ok({
        "service_name": pubspecParsed.name,
        "version": pubspecParsed.version.toString()
      });
    });

    return router;
  }
}
