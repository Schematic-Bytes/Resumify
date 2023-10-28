import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resumify/client/client.dart';
import 'package:resumify/routes/home.dart';

void main() {
  runApp(const ResumifyApp());
}

class ResumifyApp extends StatelessWidget {
  const ResumifyApp({super.key});

  // This widget is the root of your application.
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
        home: ChangeNotifierProvider(create: (context) {}, child: Home()),
      ),
    );
  }
}
