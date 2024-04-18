import 'package:flutter/material.dart';
import 'package:weather_app/src/utils/theme/base_theme.dart';

import 'routes.dart';

class AppWidget extends StatelessWidget {
  final Routes _routes = Routes();
  AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login Test',
      debugShowCheckedModeBanner: false,
      theme: baseTheme,
      initialRoute: '/',
      onGenerateRoute: _routes.generateRoute,
    );
  }
}
