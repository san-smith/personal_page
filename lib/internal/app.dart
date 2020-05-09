import 'package:flutter/material.dart';
import 'package:personal_page/presentation/home/home.dart';

import 'app_config.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'san-smith',
      theme: AppConfig.darkTheme,
      home: Home(),
    );
  }
}
