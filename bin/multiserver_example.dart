import 'package:jaguar/jaguar.dart';

main() async {
  // Serve on 0.0.0.0:8080
  final server = Jaguar(port: 10000);
  server.get("/hello", (_) => "Hello world!");

  // Listen also multiple other address:port mapping
  server.alsoTo(ConnectTo(address: 'localhost', port: 10001));
  server.alsoTo(ConnectTo(port: 10002));

  server.log.onRecord.listen(print);
  await server.serve(logRequests: true);
}
