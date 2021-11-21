import 'package:arabicinyourhands/provider/main_bottom_navigation_state.dart';
import 'package:arabicinyourhands/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  Main({Key? key}) : super(key: key);

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MainBottomNavigationState()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Арабский перед тобой',
        theme: ThemeData(primarySwatch: Colors.blueGrey, fontFamily: 'Gilroy'),
        onGenerateRoute: _appRouter.appGeneratorRoute,
        initialRoute: '/',
      ),
    );
  }
}
