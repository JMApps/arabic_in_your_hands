import 'package:arabicinyourhands/router/app_router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  Main({Key? key}) : super(key: key);

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Арабский в твоих руках',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      onGenerateRoute: _appRouter.appGeneratorRoute,
      initialRoute: '/',
    );
  }
}