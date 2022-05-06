import 'package:flutter/material.dart';

import 'core/constant/app_theme.dart';
import 'feature/movies/movies_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // title: appName,
      theme: AppTheme.light,
      home: const MoviesPage(),
    );
  }
}
