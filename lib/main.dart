import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:resumify/client/client.dart';
import 'package:resumify/routes/home.dart';

void main() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    // ignore: avoid_print
    print('${record.level.name}: ${record.loggerName}: ${record.message}');
  });

  runApp(const ResumifyApp());
}

class ResumifyApp extends StatelessWidget {
  const ResumifyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider<Client>.value(
      value: Client(),
      child: MaterialApp(
        title: 'Resumify',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const Home(),
      ),
    );
  }
}
