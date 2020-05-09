import 'package:flutter/material.dart';
import 'package:personal_page/internal/app_config.dart';

import 'widgets/main_page.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: _getBody(),
    );
  }

  Widget _getBody() {
    return PageView(
      scrollDirection: Axis.vertical,
      children: <Widget>[
        MainPage(),
      ],
    );
  }
}
